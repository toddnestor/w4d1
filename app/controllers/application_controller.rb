class ApplicationController < ActionController::Base
  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers

  def index
    render json: model.all
  end

  def create
    object = model.new(required_params)
    if object.save
      render json: object
    else
      render(
        json: object.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    render json: model.find(params[:id])
  end

  def update
    object = model.find(params[:id])

    if object.update(required_params)
      render json: object
    else
      render(
        json: object.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    object = model.find(params[:id])
    object.destroy
    render json: object
  end

  def model
    self.class.model
  end

  def self.model
    controller_name.classify.constantize
  end

  def cor
    # blank section for CORR
    render :text => ''
  end

  private
  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'DELETE, GET, POST, PUT, PATCH, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end

  def cors_preflight_check
    if request.method == :options
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'DELETE, GET, POST, PUT, PATCH, OPTIONS'
      headers['Access-Control-Allow-Headers'] = '*'
      headers['Access-Control-Max-Age'] = '1728000'
      render :text => '', :content_type => 'text/plain'
    end
  end
end

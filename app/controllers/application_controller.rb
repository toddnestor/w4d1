class ApplicationController < ActionController::Base
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
end

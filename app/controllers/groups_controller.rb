class GroupsController < ApplicationController
  def create
    group = Group.new(required_params)

    if group.save
      render json: group
    else
      render(
        json: group.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    group = Group.find(params[:id])
    group.destroy
    render json: group
  end

  def show
    group = Group.find(params[:id])
    render json: group.to_json(include: :contacts)
  end

  def update
    group = Group.find(params[:id])
    if group.update(required_params)
      render json: group
    else
      render(
        json: group.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def index
    groups = Group.where(user_id: params[:user_id])
    render json: groups
  end

  private
  def required_params
    params.require(:group).permit(:name, :user_id)
  end
end

class GroupsController < ApplicationController
  def show
    group = Group.find(params[:id])
    render json: group.to_json(include: :contacts)
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

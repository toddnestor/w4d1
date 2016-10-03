class ContactSharesController < ApplicationController
  def favorite
    share = ContactShare.find(params[:contact_share_id])
    share.favorite = true
    share.save
    render json: share
  end

  def add_to_group
    contact_group = ContactGroup.new(group_id: params[:group_id], contact_id: params[:contact_share_id])
    contact_group.save
    render json: contact_group
  end

  private
  def required_params
    params.require(:contact_share).permit(:user_id, :contact_id)

  end
end

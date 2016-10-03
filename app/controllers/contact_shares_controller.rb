class ContactSharesController < ApplicationController
  def create
    share = ContactShare.new(contact_share_params)
    if share.save
      render json: share
    else
      render(
        json: share.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    share = ContactShare.find(params[:id])
    share.destroy
    render json: share
  end

  def favorite
    share = ContactShare.find(params[:contact_share_id])
    share.favorite = true
    share.save
    render json: share
  end

  private
  def contact_share_params
    params.require(:contact_share).permit(:user_id, :contact_id)

  end
end

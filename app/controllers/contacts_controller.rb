class ContactsController < ApplicationController

  def index
    user = User.find(params[:user_id])
    contacts = user.contacts + user.shared_contacts
    render json: contacts
  end

  def create
    contact = Contact.new(contact_params)
    if contact.save
      render json: contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    render json: Contact.find(params[:id])
  end

  def update
    contact = Contact.find(params[:id])

    if contact.update(contact_params)
      render json: contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    contact = Contact.find(params[:id])
    contact.destroy
    render json: contact
  end

  def favorite
    contact = Contact.find(params[:contact_id])
    contact.favorite = true
    contact.save
    render json: contact
  end

  def add_to_group
    contact_group = ContactGroup.new(group_id: params[:group_id], contact_id: params[:contact_id])
    contact_group.save
    render json: contact_group
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email, :user_id)
  end
end

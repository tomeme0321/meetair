class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
     @contact = Contact.create(contacts_params)
     if @contact.save
      redirect_to root_path, notice: "Sent your message successfully!"
     else
      render 'new'
     end
   end

   private
  def contacts_params
    params.require(:contact).permit(:name, :email, :content)
  end
end

class ContactsController < ApplicationController
  def index
    @contacts = Contact.all   
  end

  def show
    @contact = Contact.find(params[:id]) 
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:notice] = "Sweet! Contact created!"
      redirect_to contacts_path
    else
      render :new
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      flash[:notice] = "Awesome! Contact updated!"
      redirect_to @contact
    else
      render :edit
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    flash[:notice] = "Success! Contact deleted!"
    redirect_to contacts_path
  end

private

  def contact_params
    params.require(:contact).permit(:name, :phone, :email)
  end
end

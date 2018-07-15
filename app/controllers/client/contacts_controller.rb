class Client::ContactsController < ApplicationController
  def index
    response = Unirest.get("localhost:3000/api/contacts")
    @contacts = response.body
    render "index.html.erb"
  end

  def new
    render "new.html.erb"
  end  

  def create
    response = Unirest.post("localhost:3000/api/contacts",
      parameters: {
        first_name: params[:first_name],
        middle_name: params[:middle_name],
        last_name: params[:last_name],
        email: params[:email],
        phone_number: params[:phone_number],
        bio: params[:bio],
        
      })
    flash[:success] = "New contact successfully created"
    redirect_to "/client/contacts"
  end

  def show
    contact_id = params['id']
    response = Unirest.get("localhost:3000/api/contacts/#{contact_id}")
    @contact = response.body
    render "show.html.erb"
  end

  def edit
    contact_id = params['id']
    response = Unirest.get("localhost:3000/api/contacts/#{contact_id}")
    @contact = response.body
    render "edit.html.erb"
  end

  def update
    contact_id = params['id']
    response = Unirest.patch("localhost:3000/api/contacts/#{contact_id}", 
      parameters: {
        first_name: params[:first_name],
        middle_name: params[:middle_name],
        last_name: params[:last_name],
        email: params[:email],
        phone_number: params[:phone_number],
        bio: params[:bio]
      })
    flash[:success] = "Contact successfully updated"
    redirect_to "/client/contacts/#{contact_id}"
  end

  def destroy
    contact_id = params['id']
    response = Unirest.delete("localhost:3000/api/contacts/#{contact_id}")
    flash[:success] = "Contact successfully deleted"
    redirect_to "/client/contacts"
  end
end

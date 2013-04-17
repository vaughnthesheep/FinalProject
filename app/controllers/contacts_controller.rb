class ContactsController < ApplicationController
  # GET /contacts
  # GET /contacts.json
  def index
    @contact = Contact.first

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contact }
    end
  end
end
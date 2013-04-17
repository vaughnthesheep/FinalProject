class CustomersController < ApplicationController
  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @customers }
    end
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    @customer = Customer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @customer }
    end
  end

  # GET /customers/new
  # GET /customers/new.json
  def new
    @customer = Customer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @customer }
    end
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(params[:customer])

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render json: @customer, status: :created, location: @customer }
      else
        format.html { render action: "new" }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def login_form

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @customer }
    end
  end
  
  def login
    email = params[:email]
    password = params[:password]
    respond_to do |format|
      begin
        session[:user_id] = Customer.where("email = '#{email}' AND password = '#{password}'").first.id
        format.html { redirect_to root_url }
      rescue
        flash[:warning] = "Login failed"
        format.html { redirect_to "/login_form" }
      end
    end
  end
  
  def logout
    reset_session
    respond_to do |format|
      format.html { redirect_to root_url }
    end
  end
end

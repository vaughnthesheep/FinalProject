class OrdersController < ApplicationController
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end


  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def buy_now
    @record = Record.where("id = #{params[:record]}").first
    respond_to do |format|
      format.html # buy_now.html.erb
      format.json { render json: @order }
    end
  end
  
  def checkout_one
    @record_id = params[:record_id]
    @quantity = params[:quantity]
    @order = Order.new
    @order.status = "checked out"
    @order.customer_id = session[:user_id]
    if @order.save
      @line_item = LineItem.new
      @line_item.record_id = @record_id
      @line_item.quantity = @quantity
      @line_item.order_id = @order.id
      @price = Record.where("id = #{@record_id}").first.price
      @sub = @price * @quantity
      @cust = Customer.where("id = #{session[:user_id]}").first
      @pstrate = Province.where("id = #{@cust.id}").first.pst
      @gstrate = Province.where("id = #{@cust.id}").first.gst
      @hstrate = Province.where("id = #{@cust.id}").first.hst
      @tax = (@sub * @pstrate) + (@sub * @gstrate) + (@sub * @hstrate)
      if @line_item.save
        respond_to do |format|
          format.html
          format.json { render json: @order }
        end
      else
        respond_to do |format|
          flash[:warning] = "LineItem save failed."
          format.html { redirect_to root_path}
          format.json { render json: @order }
        end
      end
    else
      respond_to do |format|
        flash[:warning] = "Order save failed."
        format.html { redirect_to root_path}
        format.json { render json: @order }
      end
    end
    
    
  end

  
end

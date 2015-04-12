class CustomerOrdersController < ApplicationController
  before_action :set_customer_order, only: [:show, :edit, :update, :destroy]

  # GET /customer_orders
  # GET /customer_orders.json
  def index
    @customer_orders = CustomerOrder.all
    @items = Item.all
    @price_array = Item.pluck(:rate)
    @sum = Item.sum(:rate)
    @count = Item.count(:qty)
    @date = CustomerOrder.pluck(:order_date)
    @order_date = @date.join(',')
    @temp = Item.where(:received => 1).count()
  end

  # GET /customer_orders/1
  # GET /customer_orders/1.json
  def show
  end

  # GET /customer_orders/new
  def new
    @orders = CustomerOrder.all
    @items = Item.all
    kit = IMGKit.new(render :new)
    return
    kit.to_jpg
    @kit = IMGKit.new(render_as_string)
    #img = @kit.to_img(:jpg)
    send_data(@kit.to_jpg, :type => "image/jpeg", :disposition => 'inline')
  end

  # GET /customer_orders/1/edit
  def edit
  end

  # POST /customer_orders
  # POST /customer_orders.json
  def create
    @orders = CustomerOrder.all
    @items = Item.all
    @count = Item.count(:qty)
    @temp = Item.where(:received => 1).count()
    render  :pdf => "Bill" , 
            :template => 'customer_orders/create.pdf.erb', # Excluding ".pdf" extension.
            page_height:  100,
            page_width:   80,
            outline: {  outline:   true}
     
  end

  # PATCH/PUT /customer_orders/1
  # PATCH/PUT /customer_orders/1.json
  def update
    respond_to do |format|
      if @customer_order.update(customer_order_params)
        format.html { redirect_to @customer_order, notice: 'Customer order was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer_order }
      else
        format.html { render :edit }
        format.json { render json: @customer_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer_orders/1
  # DELETE /customer_orders/1.json
  def destroy
    @customer_order.destroy
    respond_to do |format|
      format.html { redirect_to customer_orders_url, notice: 'Customer order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_order
      @customer_order = CustomerOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_order_params
      params.require(:customer_order).permit(:order_no, :order_date, :customer_name)
    end
end

class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]


  def add_to_order
    
    @carts = Cart.where(buyer_id: current_user.id)
    total = @carts.sum(:amount).to_i

    p=Profile.where(user_id: @carts.first.seller_id)
    seller=p[0].fullname_company

    str ='user_id=' + @carts.first.seller_id.to_s + 'AND address_type=1'
    a=Address.where(str)
    pickupaddress=a[0].full_address

    @order=Order.new
    @order.seller_id = @carts.first.seller_id
    @order.seller = seller
    @order.pickup_address = pickupaddress
    @order.order_date=Date.today
    @order.save
    @new_order_id = @order.id

    @carts.each do |cart|
      @orderitem=OrderItem.new
      @orderitem.order_id=@new_order_id

      @orderitem.product_id = cart.product_id
      @orderitem.product = cart.product
      @orderitem.seller_id = cart.seller_id
      @orderitem.buyer_id = cart.buyer_id
      @orderitem.unit_weight = cart.unit_weight
      @orderitem.unit = cart.unit
      @orderitem.unit_price = cart.unit_price
      @orderitem.qty = cart.qty
      
      @orderitem.amount = cart.amount
  
      
      @orderitem.save
      cart.order_id = @new_order_id
      cart.save
    end

    @order.amount = total
    @order.notes = current_user.stripe_id
    @order.save

   if current_user.stripe_id.blank?
      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
      )
      current_user.stripe_id = customer.id
      current_user.save!
    end

    # cus_Cpp9mVeEVbsEeH  cus_CpsM8vjeeIk8pB

      charge = Stripe::Charge.create(
        customer: current_user.stripe_id,
        amount: total,
        description: 'Order no: ' + @new_order_id.to_s,
        currency: 'AUD'
      )

      # current_user.charges << Charge.new(charge_id: charge.id)
      flash[:notice] = '$' + total.to_s + '    Payment made!' + ' for Order#: ' + @new_order_id.to_s
       redirect_back fallback_location: order_path     


       
  end
  # GET /carts
  # GET /carts.json
  def index
    str ='buyer_id=' + current_user.id.to_s
    
    @carts = Cart.where(str)
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      # params.require(:cart).permit(:order_id, :buyer_id, :product_id, :product, :seller_id, :unit_weight, :unit, :unit_price, :qty, :amount, :total_weight, :notes)
    end
end

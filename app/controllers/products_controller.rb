class ProductsController < ApplicationController
  include ActionView::Helpers::NumberHelper
  before_action :set_product, only: [:show, :add_to_cart, :edit, :update, :destroy]

  def add_to_cart
    # @cart = current_user.cart <%= current_user.id %>
    @cart=Cart.new
    @cart.product_id = @product.id
    @cart.product = @product.product_type + ' - ' + @product.description
    @cart.seller_id = @product.user_id
    @cart.buyer_id = current_user.id
    @cart.unit_weight = @product.unit_weight
    @cart.unit = @product.unit
    @cart.unit_price = @product.unit_price/100.0
    @cart.qty = params[:qty]
    @cart.amount = (params[:qty].to_d * @product.unit_price/100.0).round
    @cart.save
    # re
  end
  # GET /products
  # GET /products.json
  def index

    if params[:user_id].present?
      # @products = Product.all
      @products = Product.where(user_id: params[:user_id])
    else
      @products = Product.all
      # search_product = params[:products][:search]
      # @products = Product.where(user_id: params[:user_id])
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:image, :user_id, :product_type, :description, :unit_weight, :unit, :unit_price, :qty_stock, :qty_available, :image_data, :product_type_id)
    end
end

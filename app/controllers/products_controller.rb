class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @products = Product.all
    respond_with(@products)
  end

  def favorites
    @favorite_product = Product.find_by_id(params[:id])
    @favorite_product.increment(:favorites)
    @favorite_product.save

    redirect_to "/products/#{@favorite_product.id}"
  end

  def show
    @favorite_count = Product.find(params[:id]).favorites
    @products = Product.all.page params[:page]
    respond_with(@product)
  end

  def new
    @product = Product.new
    respond_with(@product)
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    @product.save
    respond_with(@product)
  end

  def update
    @product.update(product_params)
    respond_with(@product)
  end

  def destroy
    @product.destroy
    respond_with(@product)
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :quantity, :price, :cost, :weight, :thumbnail, :image)
  end
end


class ProductsController < ApplicationController
  require "json"

  def index
    @products = Product.all
  end
  def index2
    @products = Product.all
    string = @products.map do |product|
      {"id"=> "#{product.id}",
      "product"=> "#{product.name}",
      "price"=> "#{product.price}",
      "created_at"=> "#{product.created_at}",
      "updated_at"=> "#{product.updated_at}"}
    end
    render :json => string

  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.update(params[:id], product_params)
  end

  private
    def product_params
      params.require(:product).permit(:name, :price)
    end
end

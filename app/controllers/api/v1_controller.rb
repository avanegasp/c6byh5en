class Api::V1Controller < ApplicationController
  require "json"

  def products
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
end

module Api
  module V1
    class Api::V1::ProductsController < ApplicationController
      protect_from_forgery with: :null_session
      def index
        @products = Product.all
        render json: @products
      end

      def create
        product = Product.new(products_params)
        if product.save
          render json: @product, status: 201
        else
          render json: { errors: product.errors }, status: 422
        end
      end

      def update
        @product = Product.find(params[:id])
        if(products_params[:name] && products_params[:price])
          @product.update(products_params)
          render json: @product, status: 201
        else
          puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
          render json: @product, status: 422
      end
    end

    def destroy
      @product = Product.find(params[:id])
      @product.destroy
    end

      private
      def products_params
        params.require(:product).permit(:name, :price)
      end
    end
  end
end

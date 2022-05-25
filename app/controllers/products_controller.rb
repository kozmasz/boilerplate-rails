class ProductsController < ApplicationController

  def index
    @products = Product.list
    render json: @products
  end

end

class ProductsController < ApplicationController

  def index
    @products = Product.list(valid_attributes[:api_key])
    # because of the request limit I used this for testing
    # @products = Product.all.map(&:serialized_data)
    render json: @products
  end

  def show
    @product = Product.find(params[:id])
    @product.increment(:show_count)
    if @product.save
      # set_path_into_session
      render json: @product.serialized_data
    else
      render json: {error: common_error_message}
    end
  rescue ActiveRecord::RecordNotFound
    render json: {error: common_error_message}
  end

  def convert
    @product = Product.new(valid_attributes)
    @product.set_attributes
    if @product.save
      render json: @product.serialized_data
    else
      render json: {error: common_error_message}
    end
  end

  private

  def common_error_message
    "Something went wrong!"
  end

  def valid_attributes
    params.permit(:from, :to, :amount_param, :api_key)
  end

  # I tried to avoid the incrementation if someone wants to send requests continuously.
  # I didn't want to waste too much time for this, maybe next time.

  # def refresh_happened?
  #   session[:path] == products_path(params[:id])
  # end
  #
  # def set_path_into_session
  #   session[:path] = products_path(params[:id])
  # end
end

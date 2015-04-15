class OrdersController < ApplicationController
  include CurrentCart
  include SetModels
  before_action   :set_cart
  before_action   :set_need_attr
  skip_before_filter :authenticate_user!
  skip_before_action :verify_authenticity_token

  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(@cart)
    @order.user = current_user

    if @order.save

      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      render json: {message: "Your order saved"}
    else
      render json: @order.errors, status: :unprocessable_entity
    end

  end

  private

  def order_params
      params.require(:order).permit(:phone, :address, :total)
  end
end

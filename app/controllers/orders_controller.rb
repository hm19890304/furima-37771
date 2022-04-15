class OrdersController < ApplicationController
  def index
    @order = Order.new(order_params)
  end

  private
  def order_params
    params.permit(:user_id, :item_id)
  end
end

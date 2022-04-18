class OrdersController < ApplicationController
  def index
    @order = Order.new(order_params)
    @order_buyer = OrderBuyer.new
  end

  def new
    @order_buyer = OrderBuyer.new
  end

  def create
    @order_buyer = OrderBuyer.new(order_buyer_params)
    if @order_buyer.valid?
      @order_buyer.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.permit(:user_id, :item_id)
  end

  def order_buyer_params
    params.require(:order_buyer).permit(:post_code, :prefecture_id, :municipalities, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: item.id)
  end
end

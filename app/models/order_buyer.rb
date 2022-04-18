class OrderBuyer
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipalities, :address, :building_name, :phone_number, :order_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipalities
    validates :address
    validates :phone_number
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Buyer.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, phone_number: phone_number, order_id: order.id)
  end
end
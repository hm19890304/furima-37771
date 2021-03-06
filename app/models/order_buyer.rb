class OrderBuyer
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipalities, :address, :building_name, :phone_number, :order_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "が正しくありません。ハイフンを含んだ半角数字を入力して下さい。"}
    validates :prefecture_id, numericality: { other_than: 1, message: "を入力してください" }
    validates :municipalities
    validates :address
    validates :phone_number, numericality: true, length: { minimum:10, maximum:11 }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Buyer.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, phone_number: phone_number, order_id: order.id)
  end
end
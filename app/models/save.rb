class Save
  include ActiveModel::Model

  attr_accessor :address, :prefecture_id, :town, :post, :build, :phone, :order_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :address, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :phone, format: { with: /\A\d{10}$|^\d{11}\z/ }
    validates :post
    validates :town
    validates :prefecture_id
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(address: address, prefecture_id: prefecture_id, town: town, post: post, build: build, phone: phone, order_id: order.id)
  end
end

class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :order
  belongs_to :prefecture
  with_options presence: true do
    validates :address, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :phone,format: { with: /\A\d{11}\z/ }
    validates :post
    validates :town
    validates :prefecture_id
  end
end

class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :day
  belongs_to :prefecture
  belongs_to :user
  with_options presence: true do
    validates :image
    validates :name,           length: { maximum: 40 }
    validates :explanation,    length: { maximum: 1000 }
    validates :price, format: { with: /\A[0-9]+\z/},numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :delivery_fee_id
      validates :day_id
     validates :prefecture_id
    end
  end
end

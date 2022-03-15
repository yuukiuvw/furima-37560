class Item < ApplicationRecord
  validates :product_name, presence: true
  validates :explanation, presence: true
  validates :image, presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  with_options presence: true, numericality: { other_than: 0 } do
    validates  :category_id
    validates  :product_condition_id
    validates  :shipping_charge_id
    validates  :prefecture_id
    validates  :days_to_ship_id
  end

  belongs_to :user
  has_one   :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :days_to_ship
end

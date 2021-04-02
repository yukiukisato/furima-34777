class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :version
    validates :price
    validates :image
    validates :user_id
  end
  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :shipping_fee_burden_id, numericality: { other_than: 1 }
  validates :delivery_area_id, numericality: { other_than: 1 }
  validates :delivery_day_id, numericality: { other_than: 1 }
  
  belongs_to :user
  has_one :histry
  has_one_attached :image
end

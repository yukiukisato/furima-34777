class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :version
    
    validates :image
    validates :user_id
  end

  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}


  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :shipping_fee_burden_id, numericality: { other_than: 1 }
  validates :delivery_area_id, numericality: { other_than: 1 }
  validates :delivery_day_id, numericality: { other_than: 1 }
  
  belongs_to :user
  has_one :histry
  has_one_attached :image
end

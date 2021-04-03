class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :version
    
    validates :image
  end

  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}

  with_options  numericality: { other_than: 1 } do
  validates :category_id
  validates :status_id
  validates :shipping_fee_burden_id
  validates :delivery_area_id
  validates :delivery_day_id
  end


  belongs_to :user
  has_one :histry
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category 
  belongs_to :status
  belongs_to :shipping_fee_burden
  belongs_to :delivery_area
  belongs_to :delivery_day
end

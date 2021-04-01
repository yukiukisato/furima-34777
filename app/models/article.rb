class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee_burden
  belongs_to :delivery_area
  belongs_to :delivery_day
end

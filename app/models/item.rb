class Item < ApplicationRecord
  belongs_to :user
  has_one :histry
  has_one_attached :image
end

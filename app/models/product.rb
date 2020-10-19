class Product < ApplicationRecord
  has_many :product_feature
  has_many :pfeature, through: :product_feature

  belongs_to :country_of_origin
end

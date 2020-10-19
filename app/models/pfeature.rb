class Pfeature < ApplicationRecord
  has_many :product_feature
  has_many :product, through: :product_feature
end

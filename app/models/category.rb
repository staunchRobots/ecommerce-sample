class Category < ActiveRecord::Base
  attr_accessible :color, :name, :product_ids
  has_many :categorizations
  has_many :products, through: :categorizations
end

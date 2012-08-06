class Category < ActiveRecord::Base
  attr_accessible :color, :name
  has_many :categorizations
  has_many :products, through: :categorizations
end

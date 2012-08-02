class Product < ActiveRecord::Base
  attr_accessible :description, :name, :on_sale, :price, :qty
  validates_presence_of :description, :name, :on_sale, :price, :qty
  validates_uniqueness_of :name
  validates_numericality_of :price, :qty, greater_than: 0
end

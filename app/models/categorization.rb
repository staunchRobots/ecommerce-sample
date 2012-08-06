class Categorization < ActiveRecord::Base
  attr_accessible :category_id, :product_id
  belongs_to :products
  belongs_to :category
end

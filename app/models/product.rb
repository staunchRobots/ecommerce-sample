class Product < ActiveRecord::Base
  attr_accessible :description, :name, :on_sale, :price, :qty, :picture
  validates_presence_of :description, :name, :price, :qty
  validates_uniqueness_of :name
  validates_numericality_of :price, :qty, greater_than: 0

  def on_sale_text
    value = (self.on_sale == true) ? "Yes" : "No"
  end

  mount_uploader :picture, PictureUploader

end

class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :product_id, :quantity
  belongs_to :product
  belongs_to :cart

  def total_price
    product.price * quantity
  end

  def deliver_notification(user)
    AddItemToCartNotifier.notification(user, self.product.name).deliver
  end

end

class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :product_id, :quantity
  belongs_to :product
  belongs_to :cart

  def total_price
    product.price * quantity
  end

  # Move to observer! or to mailer directly
  def self.deliver_notification(user_name, user_email, product_name)
    AddItemToCartNotifier.notification(user_name, user_email, product_name).deliver
  end

end

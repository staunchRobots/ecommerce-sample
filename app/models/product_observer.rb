class ProductObserver < ActiveRecord::Observer
  def after_update(product)
    changed_fields = product.changes
    if changed_fields["price"]
      LineItem.where("product_id = :id", id: product.id).each do |item|
        user = item.cart.user
        Product.deliver_notification(user.first_name, user.email, product.name)
      end 
    end
  end
end

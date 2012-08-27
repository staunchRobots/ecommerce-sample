class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  belongs_to :user

  def add_product(product_id)
    current_item = line_items.find_by_product_id(product_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product_id)
    end
    current_item
  end

  def total_price
    # line_items.to_a.sum(&total_price)
    # Much cleaner
    line_items.to_a.sum { |item| item.total_price }
  end

  def total_items
    # Don't use inject please
    # line_items.map(&:quantity).sum
    line_items.map(&:quantity).inject(0) { |total, x| total + x }
  end

end

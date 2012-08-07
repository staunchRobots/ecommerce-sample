line_item_id = "<%= @line_item.id %>"
$(".line-item[data-id=#{line_item_id}]").fadeOut(1275)

remaining = "<%= @line_item.cart.total_items %>"
$("span.toolbar-cart-count > a").text("#{remaining} items")

new_total = "<%= number_to_currency(@line_item.cart.total_price) %>"
$(".total").text("Total: #{new_total}")


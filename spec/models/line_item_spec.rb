require 'spec_helper'

describe LineItem do
  let(:line_item) { FactoryGirl.create(:line_item, product: product, cart: cart) }
  let(:product) { FactoryGirl.create(:product) }
  let(:cart) { FactoryGirl.create(:cart) }
    
  it "references a product" do
    line_item.should_receive(:product).and_return(product)
    line_item.product
  end
  
  it "returns a total price" do
    line_item.should_receive(:total_price).and_return("9.99")
    line_item.total_price
  end

end

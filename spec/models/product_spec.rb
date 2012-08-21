require 'spec_helper'

describe Product do

  let(:product) { FactoryGirl.create(:product, on_sale: true,
    categories: [ category ]) }
  let(:category) { FactoryGirl.create(:category) }
  
  it "should not be valid without a name" do
    product.name = nil
    product.should_not be_valid
  end

  it { product.categories.should include(category) }

  context "not in stock" do
    let(:product) { FactoryGirl.create(:product, on_sale: false, qty: 0) }
    it "should not be available" do
      product.should_not be_in_stock
    end
  end

  context "not for sale" do
    let(:product) { FactoryGirl.create(:product, on_sale: false) }
    its("on_sale_text") { should == "No" }
  end
 
end

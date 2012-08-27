require 'spec_helper'

describe Cart do
  let(:cart) { FactoryGirl.create(:cart) }
  let(:line_item) { FactoryGirl.create(:line_item) }

  context "initially" do
    its('total_items') { should == 0 }
    its(:line_items) { should be_empty }
  end

  it "should allow to add a single product to it" do
    cart.should_receive(:add_product).with(1).and_return(line_item)
    cart.add_product(1)
  end

  context "when a product it's there" do
    context "when I add the same product" do
      # Before each for 1 method? 
      before(:each) { cart.line_items = [ line_item ] }      
      it "does not create a new item" do
        expect { cart.add_product(line_item.product_id) }.to change { LineItem.count }.by(0)
      end
    end
  end

end

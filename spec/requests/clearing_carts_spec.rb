require 'spec_helper'

describe "Clearing Carts" do

  let(:product) { FactoryGirl.create(:product, on_sale: true) }
  let(:line_item) { FactoryGirl.create(:line_item, product_id: product.id) }

  let(:user) do
    FactoryGirl.create(:user, first_name: "Jose", last_name: "E",
      birthday: "1960-11-16", country: "Transylvanya", 
      email: "jose@gmail.com", password: "josejose")
  end

  before(:each) {
    visit home_url
    click_link "Log In"
    fill_in('Email', with: user.email)
    fill_in('Password', with: user.password)
    click_button "Sign in" 
  }

  context "as a signed in user" do    
    before(:each) {
      user.cart = FactoryGirl.create(:cart, user_id: user.id, line_items: [ line_item ])
    }

    it "clears shopping cart" do
      visit cart_path(user.cart)
      click_link "Clear Cart"
      page.should have_content "You have successfully cleared your cart."
      user.cart.line_items.count.should == 0
    end
  end

end

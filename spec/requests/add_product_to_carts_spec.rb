require 'spec_helper'

describe "Adding a product to shopping cart" do

  let!(:product) { FactoryGirl.create(:product, on_sale: true) }
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

  context "as a logged in user" do
    it "should be able to add a product to her cart" do
      visit products_path
      product.should be_in_stock
      page.should have_content "Arc Reactor"
      click_link "DETAILS"
      click_link "Add to Cart"
      page.should have_content "You have added an item to your Cart"
      user.cart.line_items.count.should == 1
    end
  end

end

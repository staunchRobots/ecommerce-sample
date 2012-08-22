require 'spec_helper'

describe "Catalog Display" do
  let!(:category) { FactoryGirl.create(:category) }

  context "as a user" do     
    it "should display Catalog categories" do
      visit home_url
      click_link "Catalog"
      page.should have_content category.name
    end
  end

  context "as a user" do

    let!(:category) { FactoryGirl.create(:category) }
    let!(:product) { FactoryGirl.create(:product) }
    let!(:categorization) { FactoryGirl.create(:categorization) }

    before(:each) {
      product.categorizations << categorization
      category.categorizations << categorization
      category.reload
      product.reload
      visit home_url
      click_link "Catalog"       
    }

    it "should be able to display a Category's products" do     
      click_link category.name
    end
  end
   
end

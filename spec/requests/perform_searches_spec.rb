require 'spec_helper'

describe "Perform a search" do

  context "for an existing product" do
    let!(:product) { FactoryGirl.create(:product, on_sale: true) }  
    it "should be able to find it" do
      visit home_url
      fill_in("q", with: "arc")
      find("form a").click
      page.should have_content("Search Results:")
      page.should have_content(product.name)
    end
  end

  context "for a non-existing product" do
    it "should not be able to find it" do
      visit home_url
      fill_in("q", with: "product")
      find("form a").click
      page.should have_content "No products were found, sorry."
    end
  end

end

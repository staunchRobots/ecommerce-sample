require 'spec_helper'

describe User do

  let(:user) do
    FactoryGirl.create(:user, first_name: "Michael",
      last_name: "Jackson", email: "michael@neverland.org",
      password: "password", birthday: "1960-01-01",
      country: "United States")
  end

  let(:cart) { FactoryGirl.create(:cart) }

  it "should not be valid without required fields" do
    user = FactoryGirl.build(:user)
    user.should_not be_valid  
  end

  context "with an admin role" do
    let(:admin) { FactoryGirl.create(:role, name: "admin") }
    let(:user) { FactoryGirl.build(:user, roles: [ admin ]) } 
    it "is an admin" do
      user.roles.should include(admin)  
    end
  end

  it "has a unique shopping Cart" do
    user.should_receive(:current_cart).and_return(cart)
    user.current_cart
  end
  
end

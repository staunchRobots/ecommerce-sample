require 'spec_helper'

describe "UserSignIns" do
  let(:user) do
    FactoryGirl.create(:user, first_name: "Jose", last_name: "E",
      birthday: "1960-11-16", country: "Transylvanya", 
      email: "jose@gmail.com", password: "josejose")
  end

  context "FrontEnd#sign_in" do
    it "should log in a registered user" do
      visit home_url
      click_link "Log In"
      fill_in('Email', with: user.email)
      fill_in('Password', with: user.password)
      click_button "Sign in"
      page.should have_content "Signed in successfully." 
    end 
  end

  context "FrontEnd#sign_out" do
    it "should log out a logged in user" do
      visit home_url
      click_link "Log In"
      fill_in('Email', with: user.email)
      fill_in('Password', with: user.password)
      click_button "Sign in"
      click_link "Log Out"
      page.should have_content "Signed out successfully."        
    end
  end

end



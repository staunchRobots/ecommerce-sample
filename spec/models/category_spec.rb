require 'spec_helper'

describe Category do

  let(:category) { FactoryGirl.create(:category) }

  it "is valid with basic fields" do
    category.should be_valid  
  end
end

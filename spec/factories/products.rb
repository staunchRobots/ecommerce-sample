# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    name "Arc Reactor"
    description "Product desc..."
    qty 1
    price "9.99"
  end
end

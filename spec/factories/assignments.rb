# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :assignment do
    # use associations instead of predefined data
    user_id 1
    role_id 1
  end
end

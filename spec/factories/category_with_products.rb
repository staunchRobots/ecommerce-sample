FactoryGirl.define do
  factory :category_with_products, class: Category do
    name "Tech"
    color "blue"

    after(:create) do |category|
      categorization = FactoryGirl.create(:categorization) 
      product = FactoryGirl.create(:product)
      product.categorizations << categorization
      category.categorizations << categorization
      category.reload
      product.reload
    end

  end
end

module ProductsHelper

  def colored_category_name_for(category)
    content_tag :div, category.name, class: "categorized #{category.color}"
  end 

end

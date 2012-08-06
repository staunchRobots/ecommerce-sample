module ApplicationHelper

  def picture_for(product)
    picture = (product.picture_url.nil?) ?
      image_tag("no-image.jpg", alt: "product") :
      image_tag(product.picture_url(:thumb).to_s, alt: "product", size: "170x165")  
  end
  
end

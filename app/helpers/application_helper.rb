module ApplicationHelper

  def picture_for(product)
    # Why do you need assign variable here?
    # Why parenthesis () ?
    # Trinary operators aren't for long constructions, see next method(much cleaner)
    picture = (product.picture_url.nil?) ?
      image_tag("no-image.jpg", alt: "product") :
      image_tag(product.picture_url(:thumb).to_s, alt: "product", size: "170x165")
  end

  def avatar_for(user)
    if user.avatar_url.nil?
      image_tag("default_avatar.jpg", alt: "avatar", size: "110x110")
    else
      image_tag(user.avatar_url(:medium).to_s, alt: "avatar", size: "110x110")
    end
  end

end

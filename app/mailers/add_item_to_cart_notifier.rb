class AddItemToCartNotifier < ActionMailer::Base
  default from: "jlecampana@gmail.com"

  def notification(user_name, user_email, product_name)
    @user_name = user_name
    @product = product_name
    mail(to: user_email,
      subject: "A product has been added to your shopping cart") do |format|
        format.html { render "notification" }
      end    
  end

end



class AddItemToCartNotifier < ActionMailer::Base
  default from: "jlecampana@gmail.com"

  def notification(user, product_name)
    @user = user
    @product = product_name
    mail(to: @user.email,
      subject: "A product has been added to your shopping cart") do |format|
        format.html { render "notification" }
      end    
  end

end



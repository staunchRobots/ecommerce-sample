class PriceChangeNotifier < ActionMailer::Base
  default from: "jlecampana@mail.com"
 
  def notification(user_name, user_email, product_name)
    @user_name = user_name
    @product = product_name
    
     mail(to: user_email,
      subject: "Warning: a product in your cart has changed its price") do |format|
        format.html { render "notification" }
      end
  end

end


# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Ecommerceapp::Application.initialize!

#Ecommerceapp::Application.configure do
#  config.action_mailer.delivery_method = :smtp
#  config.action_mailer.raise_delivery_errors = true
#  config.action_mailer.perform_deliveries = true
#  config.action_mailer.smtp_settings = {
#    address: "smtp.gmail.com",
#    port: "587",
#    domain: "gmail.com",
#    authentication: "plain",
#    user_name: ENV['GMAIL_SMTP_USERNAME'],
#    password: ENV['GMAIL_SMTP_PASSWORD'],
#    enable_starttls_auto: false
#  }
#end

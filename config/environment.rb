# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!


#Rails.application.routes.default_url_options[:host] = "http://www.aspap.org/"


  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default :charset => "utf-8"
  config.action_mailer.smtp_settings = {
    :address => "smtp.gmail.com",
    :port => 587,
    :domain => 'smtp.gmail.com',
    :user_name => ENV.fetch('MY_GMAIL'),
    :password => ENV.fetch('PASSWORD'),
    :authentication => :login,
    :enable_starttls_auto => true,
    :tls => true
  } 
# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!


#Rails.application.routes.default_url_options[:host] = "http://www.aspap.org/"


ActionMailer::Base.smtp_settings = {
 :address        => 'smtp.sendgrid.net',
 :port           => 465,
 :authentication => :plain,
 :user_name      => ENV['SENDGRID_USERNAME'],
 :password       => ENV['SENDGRID_PASSWORD'],
 :domain         => 'heroku.com',
 :enable_startstls_auto => true
}


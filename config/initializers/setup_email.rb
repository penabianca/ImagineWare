# Load the rails application
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => "587",
  :domain => "gmail.com",
  :authentication => "plain",
  :user_name => "imaginewarecs169group19@gmail.com",
  :password => "imaginewarecs169",
  :enable_starttls_auto => true
}

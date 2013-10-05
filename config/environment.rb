# Load the rails application
require File.expand_path('../application', __FILE__)
if ENV['RAILS_ENV'] == 'production'
  ActiveSupport::Deprecation.silenced = true
end
# Initialize the rails application
HospitalLink::Application.initialize!

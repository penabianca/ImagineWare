#task to create admin user for app set-up
#be sure to alter the
namespace :db do
  desc "Add admin user to database"
  task :admin_user => :environment do
    User.create(:first_name => 'Alex', :last_name => 'Hu',
                :email => 'change@this.org', :password => 'changethis',
                :password_confirmation => 'changethis', :role => 'admin')
  end
end

namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.new(first_name: "Aime",
                         last_name: "Ngongang",
                         email: "aimechicago5@gmail.com",
                         password: "mypassword",
                         password_confirmation: "mypassword")
    admin.admin= true
    admin.instruc= false
    admin.status= "approved"
    admin.save
    
  end
end

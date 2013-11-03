Given /the following users exist/ do |users_table|
    users_table.hashes.each do |user|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that course to the database here.
      @user             = User.new
      @user.first_name  = user['first_name']
      @user.last_name   = user['last_name']
      @user.password    = user['password']
      @user.password_confirmation = user['password']
      @user.save
    end
end

Given /that (.*) is logged in/ do |user_email|
    session[:current_user] = User.find_by_email(user_email).id
end

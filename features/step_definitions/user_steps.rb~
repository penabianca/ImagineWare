Given /the following users exist/ do |users_table|
    users_table.hashes.each do |user|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that course to the database here.
    User.create!(user)
    end
end

Given /that (.*) is logged in/ do |user_email|
    params[:user_email] = "sd@gmail.com"
    params[:user_psswd] = "cs169rocks"
    redirect_to users_controller_login
end

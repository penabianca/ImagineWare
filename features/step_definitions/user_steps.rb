Given /the following users exist/ do |users_table|
    users_table.hashes.each do |user|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that course to the database here.
      @user             = User.new
      @user.id          = user['id']
      @user.email       = user['email']
      @user.first_name  = user['first_name']
      @user.last_name   = user['last_name']
      @user.password    = user['password']
      @user.password_confirmation = user['password']
      @user.instruc     = (user['instruc'] == 'true' ? true : false)
      @user.admin       = (user['admin'] == 'true' ? true : false)
      @user.status      = (user['status'] == 'approved' ? 'approved' : 'pending') 
      @user.save
    end
end

Given /^that (.*) is logged in with password (.*)$/ do |user_email, user_password|
    step "I am on the home page"
    step "I should see \"Sign in\""
    step "I follow \"Sign in\""
    step "I fill in \"session_email\" with \"#{user_email}\""
    step "I fill in \"session_password\" with \"#{user_password}\""
    step "I press \"Sign in\""
end

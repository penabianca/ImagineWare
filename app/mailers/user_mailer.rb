class UserMailer < ActionMailer::Base
  default to: Proc.new{User.where('admin'=> true ).pluck(:email)},
         from: 'imaginewarecs169group19@gmail.com'


  def verify_instructor(user)
    @user = user
    mail( subject: 'A new Instructor signed up !')
  end
end

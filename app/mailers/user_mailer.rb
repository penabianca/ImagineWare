class UserMailer < ActionMailer::Base
  default from: 'imaginewarecs169group19@gmail.com'

  def verify_instructor(user)
    @user = user
    #@url  = 'http://example.com/login'
    mail(to: 'aimechicago5@gmail.com', subject: 'Welcome to Imagineware online course platform')
  end
end

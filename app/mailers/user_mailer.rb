=begin
class UserMailer < ActionMailer::Base
  default to: Proc.new{User.where('admin'=> true ).pluck(:email)},
         from: 'imaginewarecs169group19@gmail.com'
  
  def verify_instructor(user)
    @user = user
    mail( subject: 'A new Instructor signed up !')
  end

  def welcome_instructor(user)
    @user = user
    mail( to: @user.email , subject: 'Welcome to the Instructor group of Imagineware')
  end
  def assignment_graded(submission)
    @user = User.find(submission.user_id)
    @course = Course.find(submission.course_id)
    mail( to: @user.email, subject: 'Your Assignment has been graded')
  end
end
=end

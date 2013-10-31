class SubmissionsController < ApplicationController

  def show
    id = params[:id]
    @submission = Submission.find(id) 
    # will render app/views/Courses/show.<extension> by default
  end

  def index
    @submissions = Submission.where("student_id = #{session[:current_user]}").to_a
    
  end

  def create
    @submission = Submission.create!(params[:Submission])
    flash[:notice] = "Your submission for #{Course.find(@submission.course_id).title} was successful"
    redirict_to user_path
  end

  def update
    @submission = Submission.find params[:id]
    @submission.update_attributes!(params[:Submission])
    flash[:notice] = "#{User.find(@submission.user_id).first_name}'s submission for #{Course.find(@submission.course_id).title} has been graded"
    redirect_to course_path(@course)
  end

end

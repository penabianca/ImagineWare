class SubmissionsController < ApplicationController

  def show
    @submission = Submission.find(params[:id])
  end
  def student
    @student_submissions = Submission.where("student_id = #{session[:current_user]}").to_a
  end
=begin
  def grade
    @submission = Submission.find params[:id]
    @submission.update_attributes!(params[:submission])
  end
=end
  def index
    @submissions = Submission.where("student_id = #{session[:current_user]}").to_a
    
  end

  def create
    @submission = Submission.create!(params[:Submission])
    if @submission.save
      flash[:notice] = "Your submission for #{Course.find(@submission.course_id).title} was successful"
      redirect_to :action => :show , :id => @submission.id
    end
  end
=begin
  def leave_feedback
    @submission = Submission.find (params[:id])
    @submission.update_attributes!(params[:Submission])
    redirect_to students_path
  end
=end
  def update
    @submission = Submission.find params[:id]
    @submission.update_attributes!(params[:Submission])
    #flash[:notice] = "#{User.find(@submission.user_id).first_name}'s submission for #{Course.find(@submission.course_id).title} has been graded"
    #redirect_to course_path(@course)
  end

end

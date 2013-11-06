class SubmissionsController < ApplicationController
  def show
    id = params[:id]
    @submission = Submission.find(id) 
  end

  def index
    @submissions = Submission.where("student_id = #{session[:current_user]}").to_a
  end

  def create
    @submission = Submission.create!(params[:Submission])
    flash[:notice] = "Your submission for #{Course.find(@submission.course_id).title} was successful"
    redirict_to user_path
  end
end

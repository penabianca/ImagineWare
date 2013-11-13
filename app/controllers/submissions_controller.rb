class SubmissionsController < ApplicationController

  def show
    @submission = Submission.find(params[:id])
  end
  def student
    @student_submissions = Submission.where("user_id = #{session[:current_user]}").to_a
  end
  def index
    @submissions = Submission.where("user_id = #{session[:current_user]}").to_a
  end
  def new
  end
  def submit
    @submission = Submission.new_submission(current_user, session[:course])
    if @submission.save
      flash.now[:notice] = "Your submission for #{Course.find(@submission.course_id).title} was successful"
    end
  end
  def create
    @submission = params[:submission]? Submission.new(params[:submission]): Submission.new_submission
    if @submission.save
      flash[:notice] = "Your submission for #{Course.find(@submission.course_id).title} was successful"
      redirect_to :action => :show , :id => @submission.id
    else
      render "new"
    end
  end
  def edit
    @submission = Submission.find params[:id]
  end
  def update
    @submission = Submission.find params[:id]
    @submission.update_attributes!(params[:submission])
    flash.now[:notice] = "#{User.find(@submission.user_id).first_name}'s submission for #{Course.find(@submission.course_id).title} has been graded"
    redirect_to students_path
  end

end

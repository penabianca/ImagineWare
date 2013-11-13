class SubmissionsController < ApplicationController

 def my_grades
    @my_sub = Submission.where('user_id' => session[:current_user])
  end

  def show
    @submission = Submission.find(params[:id])
  end
  def student
    @student_submissions = Submission.where('user_id' => params[:id].to_i)
  end
  def index
    @submissions = Submission.all
  end
  def new
  end
  def submit
    @submission = Submission.new_submission
    @submission.user_id = session[:current_user]
    @submission.course_id = session[:course]
    if @submission.save
      flash.now[:notice] = "#{session[:current_user]} Your submission for #{Course.find(@submission.course_id).title} was successful"
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
    @submission.grader_id = session[:current_user].to_i
    @submission.update_attributes!(params[:submission])
    flash[:notice] = "#{User.find(@submission.user_id).first_name}'s submission for #{Course.find(@submission.course_id).title} has been graded"
    redirect_to students_path
  end

end

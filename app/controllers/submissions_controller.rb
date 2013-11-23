class SubmissionsController < ApplicationController

  def my_grades
    @my_sub = Submission.where('user_id' => session[:current_user])
  end
  def assignments_to_grade
    @to_grade = Submission.non_graded_assignments
  end
  def show
    @submission = Submission.find(params[:id])
  end
  def student
    @student_submissions = Submission.student_submissions(params[:id])
  end
  def index
    @submissions = Submission.all
  end
  def new
  end
  def uploadFile
    post = Submission.save(params[:upload])
    render :text => "File has been uploaded successfully"
  end
  def submit
    @submission = Submission.new_submission
    @submission.user_id = session[:current_user]
    @submission.course_id = session[:course]
    if @submission.save
      flash.now[:success] = "Your submission for #{Course.find(@submission.course_id).title} was successful"
      flash.keep
    end
    redirect_to course_path(@submission.course_id)
  end

  def edit
    @submission = Submission.find params[:id]
  end
  def update
    @submission = Submission.find params[:id]
    @submission.grader_id = session[:current_user].to_i
    @submission.update_attributes!(params[:submission])
    UserMailer.assignment_graded(@submission).deliver
    flash[:success] = "#{User.find(@submission.user_id).first_name}'s submission for #{Course.find(@submission.course_id).title} has been graded"
    redirect_to students_path
  end

end

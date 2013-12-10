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
  def upload
    return if params[:attachment].blank?

    @attachment = Attachment.new
    @attachment.uploaded_file = params[:attachment]

    if @attachment.save
      flash[:notice] = "Your file was successfully attached please press on submit assignment..."
      redirect_to  :back
      session[:file_id] = @attachment.id
    else
      flash[:error] = "There was a problem submitting your attachment."
      redirect_to upload_path
    end
  end
  
  def submit
    @submission = Submission.new_submission
    @submission.attachment_id = session[:file_id]
    @submission.user_id = session[:current_user]
    @submission.course_id = session[:course]
    if @submission.save
      flash.now[:success] = "Your submission was successful"
      flash.keep
    end
    redirect_to student_submissions_path(session[:current_user])
  end

  def edit
    @submission = Submission.find params[:id]
    session[:file_id] = @submission.attachment_id
  end
  def download
    
    @attachment = Attachment.find(session[:file_id])
    send_data @attachment.data, :filename => @attachment.filename, :type => @attachment.content_type 
  end
  def update
    @submission = Submission.find params[:id]
    @submission.grader_id = session[:current_user].to_i
    @submission.update_attributes!(params[:submission])
    begin
      UserMailer.assignment_graded(@submission).deliver
      flash[:success] = "#{User.find(@submission.user_id).first_name}'s submission for #{Course.find(@submission.course_id).title} has been graded"
    rescue
      flash[:error] = "#{User.find(@submission.user_id).first_name}'s submission for #{Course.find(@submission.course_id).title} has been graded but he/she does not have a valid email"
    end
    redirect_to students_path
  end

end

class CourseController < ApplicationController
  def show
    id = params[:id] # retrieve Course ID from URI route
    @course = Course.find(id) # look up Course by unique ID
    # will render app/views/Courses/show.<extension> by default
  end

  def index
  end

  def new
    # default: render 'new' template
  end

  def create
    @course = Course.create!(params[:Course])
    flash[:notice] = "#{@course.title} was successfully created."
    redirect_to courses_path
  end

  def edit
    @course = Course.find params[:id]
  end

  def update
    @course = Course.find params[:id]
    @course.update_attributes!(params[:Course])
    flash[:notice] = "#{@course.title} was successfully updated."
    redirect_to course_path(@course)
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    flash[:notice] = "Course '#{@course.title}' deleted."
    redirect_to courses_path
  end

end

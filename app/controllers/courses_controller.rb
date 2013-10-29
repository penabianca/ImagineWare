class CoursesController < ApplicationController
  def index
    @pasta = params[:tag]
    if params[:tag]
      @courses = Course.tagged_with(params[:tag], :any => true)
    else
      @courses = Course.all
    end
  end

  def show
    @course = Course.find(params[:id])
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

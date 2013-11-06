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
end

require 'spec_helper'

describe CoursesController do
  begin describe "POST #create" do
    it 'creates a new course' do
      expect{
        post :create, course: FactoryGirl.attributes_for(:course)
      }.to change(Course,:count).by(1)
    end
    it 'redirects to courses' do
      post :create, course: FactoryGirl.attributes_for(:course)
      response.should redirect_to courses_path
    end
  end
  describe "GET #index" do
    it 'gets courses' do
      course = FactoryGirl.create(:course)
      get :index
      assigns(:courses).should eq([course])
    end
    it 'renders index' do
      get :index
      response.should render_template :index
    end
  end
  describe "GET #show" do
    it 'assigns the course to @course' do
      course = FactoryGirl.create(:course)
      get :show, id: course
      assigns(:course).should eq(course)
    end
    it 'renders the show' do
      get :show, id: FactoryGirl.create(:course)
      response.should render_template :show
    end
  end
end
end

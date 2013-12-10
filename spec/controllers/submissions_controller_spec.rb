require 'spec_helper'

describe SubmissionsController do
  before(:each) do
    @course = FactoryGirl.create(:course)
    @submission = FactoryGirl.create(:submission)
  end
  begin describe "POST #upload" do   
    it 'uploads a new attachment' do
      expect{
        post :upload, attachment: FactoryGirl.attributes_for(:attachment)
      }.to change(Attachment,:count).by(1)
    end
  end
  describe "POST #submit" do   
    it 'uploads a new submission' do
      expect{
        post :submit, course: @course
      }.to change(Submission,:count).by(1)
    end
  end
  describe "GET #index" do
    it 'gets submissions' do
      get :index
      assigns(:submissions).should eq([@submission])
    end
    it 'renders index' do
      get :index
      response.should render_template :index
    end
  end
=begin
  describe "GET #show" do
    it 'assigns the submission to @submission' do
      submission = FactoryGirl.create(:submission)
      get :show, id: submission
      assigns(:submission).should eq(submission)
    end
    it 'renders the show' do
      get :show, id: FactoryGirl.create(:submission)
      response.should render_template :show
    end
  end
=end
end
end

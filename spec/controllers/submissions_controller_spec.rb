require 'spec_helper'

describe SubmissionsController do
  begin describe "POST #create" do
    it 'creates a new submission' do
      expect{
        post :create, submission: FactoryGirl.attributes_for(:submission)
      }.to change(Submission,:count).by(1)
    end
    it 'renders the show' do
      get :show, id: FactoryGirl.create(:submission)
      response.should render_template :show
    end
  end
  describe "GET #index" do
    it 'gets submissions' do
      submission = FactoryGirl.create(:submission)
      get :index
      assigns(:submissions).should eq([submission])
    end
    it 'renders index' do
      get :index
      response.should render_template :index
    end
  end
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
end
end

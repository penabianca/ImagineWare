require 'spec_helper'

describe UsersController do
  begin describe "POST #create" do
    it 'creates a new user' do
      expect{
        post :create, user: FactoryGirl.attributes_for(:user)
      }.to change(User,:count).by(1)
    end
    it 'redirects to users' do
      post :create, user: FactoryGirl.attributes_for(:user)
      response.should redirect_to users_path
    end
  end
  describe "GET #index" do
    it 'gets users' do
      user = FactoryGirl.create(:user)
      get :index
      assigns(:users).should eq([user])
    end
    it 'renders index' do
      get :index
      response.should render_template :index
    end
  end
  describe "GET #show" do
    it 'assigns the user to @user' do
      user = FactoryGirl.create(:user)
      get :show, id: user
      assigns(:user).should eq(user)
    end
    it 'renders the show' do
      get :show, id: FactoryGirl.create(:user)
      response.should render_template :show
    end
  end
end
end

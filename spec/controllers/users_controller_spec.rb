
require 'spec_helper'

describe UsersController do
  before(:each) do
    @user = FactoryGirl.create(:instructor)
  end
  begin describe "POST #create_instructors" do
    it 'creates a new instructor user' do
      expect{
        post :create_instructors, instructors: [@user]
        get :accept, id: @user
      }.to change(User,:count).by(1)
    end
    it 'renders the show' do
      get :show, id: @user
      response.should render_template :show
    end
  end
=begin
  describe "GET #index" do
    it 'gets users' do
      get :index
      assigns(:users).should eq([@user])
    end
    it 'renders index' do
      get :index
      response.should render_template :index
    end
  end
=end
  describe "GET #show" do
    it 'assigns the user to @user' do
      get :show, id: @user
      assigns(:user).should eq(@user)
    end
    it 'renders the show' do
      get :show, id: @user
      response.should render_template :show
    end
  end
  describe "PUT #update" do
    it 'updates the @user' do
      put :update, id: @user
      response.should render_template :show
    end
  end
  #describe "DELETE #destroy" do
  #  it 'deletes the user' do
  #    expect{
  #      delete :destroy, id: @user
  #    }.to change(Course,:count).by(1)
  #  end
  #end
end
end


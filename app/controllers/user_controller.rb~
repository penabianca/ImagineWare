class UserController < ApplicationController
  def show
    id = params[:id] # retrieve user ID from URI route
    @user = User.find(id) # look up user by unique ID
    # will render app/views/users/show.<extension> by default
  end

  def new
    # default: render 'new' template
  end

  def create
    @user = User.create!(params[:user])
    flash[:notice] = "#{@user.title} was successfully created."
    redirect_to users_path
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    @user.update_attributes!(params[:user])
    flash[:notice] = "#{@user.title} was successfully updated."
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User '#{@user.title}' deleted."
    redirect_to users_path
  end

  def login
    #Authenticate params[:user_email] and params[:user_psswd] (AIME)
    session[:current_user] = User.find_by(email: params[:user_email]).id
    redirect_to courses_path
  end

end

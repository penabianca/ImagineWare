class UsersController < ApplicationController
  def show
    @user = User.find(params[:id]) # look up user by unique ID
  end

  def new
    # default: render 'new' template
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to ImagineWare Online Course Platform."
      redirect_to  @user
    else
      flash[:fail] = "You did not enter all the fields correctly"
      render 'new'
    end
    #redirect_to users_path
  end
  private 
    def user_params
      params.require(:user).permit(:first_name,:last_name, :email, :password,:password_confirmation)
    end
  #{@user.email}
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

end

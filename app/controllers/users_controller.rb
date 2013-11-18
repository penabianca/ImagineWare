class UsersController < ApplicationController
  before_filter :signed_in_user , only: [:index,:edit,:update]
  before_filter :correct_user, only: [:edit, :update]
  def show
    @user = User.find(params[:id]) # look up user by unique ID
  end

  def index
    @users = User.all
  end
  def students
    @students = User.where('instruc' => false).paginate(:page => params[:page],per_page: 5)
  end

  def instructors
    @instructors = User.where('instruc' => true).paginate(:page => params[:page],per_page: 5)
  end

  def new
    # default: render 'new' template
  end
  def new_instructors
  end
=begin
  def create_instructors
    @user = User.new(params[:user])
    #approves you, you will get notified"
    @user.instruc ="true"
    if @user.save
      sign_in @user
      flash.now[:notice] = "Thank you for signin up as instructors" 
      UserMailer.verify_instructor(@user).deliver
      redirect_to @user
    end
  end
=end
  def create
    @user = User.new(params[:user])
    @user.instruc = "false"
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to ImagineWare Online Course Platform."
      redirect_to @user
    else
      flash.now[:fail] = "You did not enter all the fields correctly"
      render 'new'
    end
    #redirect_to users_path
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash.now[:notice] = "User '#{@user.first_name}' deleted."
    redirect_to instructors_path
  end
  def edit
    @user = User.find params[:id]
  end

  def update
    if @user.update_attributes(user_params)
      flash[:sucess] ="Profile updated"
      redirect_to @user
    else
      flash[:error] = "Invalid update informations"
      render 'edit'
    end
  end
  private 
    def user_params
      params.require(:user).permit(:first_name,:last_name, :email, :password,:password_confirmation)
    end
    def signed_in_user
      redirect_to signin_url, notice: "Please sign in!" unless signed_in?
    end
    def correct_user
      @user = User.find(params[:id])
      redirect_to (root_url) unless current_user?(@user)
    end

end

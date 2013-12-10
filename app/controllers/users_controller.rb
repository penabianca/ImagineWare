class UsersController < ApplicationController
  before_filter :signed_in_user , only: [:index,:edit,:update]
  before_filter :correct_user, only: [:edit, :update]
  before_filter :admin_user, only: [:destroy]
  def show
    @user = User.find(params[:id]) # look up user by unique ID
  end

  def index
    @users = User.all
  end
  def students
    @students = User.students.paginate(:page => params[:page],per_page: 5)
  end

  def instructors
    @instructors = User.instructors.paginate(:page => params[:page],per_page: 5)
  end

  def new
    # default: render 'new' template
  end
  def requests
    @req = User.instructors_requests.paginate(:page => params[:page],per_page: 5)
  end
  def accept
    @user = User.find(params[:id])
    @user.status = "approved"
    @user.instruc = true
    if @user.save
      UserMailer.welcome_instructor(@user).deliver
      flash.now[:success] = "Thanks for approving Mr #{@user.first_name} #{@user.last_name} as an instructor!"

    else
      flash.now[:error] = "Sorry #{@user.first_name} #{@user.instruc} #{@user.status} #{@user.password}"
    end

  end
  def create_instructors
    @user = User.new(params[:user])
    if @user.password.blank? or @user.password.length <6
      flash[:error] =". Password should be at least six characters long"
      #redirect_to signup_instructor_path
    elsif @user.password_confirmation.blank? or @user.password_confirmation.length <6
      flash[:error] = ". Password confirmation should be at least six characters long"
      #redirect_to signup_instructor_path
    else
      @user.status = "pending"
      if @user.save
        UserMailer.verify_instructor(@user).deliver
        flash.now[:success]= "Your request was sent to the administrator"
        redirect_to user_path(@user)
      else
        flash.now[:error] = "You did not enter all the fields correctly"
        #redirect_to signup_instructor_path
      end
    end
  end
  def create
    @user = User.new(params[:user])
    if @user.password.blank? or @user.password.length <6
      flash[:error] =". Password should be at least six characters long"
      if @user.password_confirmation.blank?
	      flash[:error] = ". Please enter the password confirmation"
      end
      render 'new'
    #elsif @user.password_confirmation.blank? or @user.password_confirmation.length <6
      #flash[:error] = ". Please enter the password confirmation"
      #render 'new'
    else
      @user.instruc = false
      @user.status = "approved"
      if @user.save
        sign_in @user
        flash[:success] = "Welcome to ImagineWare Online Course Platform."
        redirect_to user_path(@user)
      else
        flash.now[:error] = "You did not enter all the fields correctly"
        render 'new'
      end
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
      flash[:success] ="Profile updated"
      redirect_to user_path(@user)
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
    def admin_user
      redirect_to (root_path) unless current_user.admin?
    end

end

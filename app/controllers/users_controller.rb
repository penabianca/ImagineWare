class UsersController < ApplicationController
  before_filter :signed_in_user , only: [:index,:edit,:update]
  before_filter :correct_user, only: [:edit, :update]
  before_filter :admin_user, only: [:destroy,:update]
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
    if @user.save!
      flash[:success] = "yeeeah"
    else
      flash[:failure] = "Sorry '#{@user.first_name}' '#{@user.instruc}' '#{@user.status}' '#{@user.password}'"
    end

  end
  def create_instructors
    @user = User.new(params[:user])
    if @user.password.blank? or @user.password.length <6
      flash[:error] =". Password should be at least six characters long"
      render 'new'
    elsif @user.password_confirmation.blank? or @user.password_confirmation.length <6
      flash[:error] = ". Password confirmation should be at least six characters long"
      render 'new'
    else
      @user.status = "pending"
      if @user.save
        UserMailer.verify_instructor(@user).deliver
      end
    end
  end
  def create
    @user = User.new(params[:user])
    if @user.password.blank? or @user.password.length <6
      flash[:error] =". Password should be at least six characters long"
      render 'new'
    elsif @user.password_confirmation.blank? or @user.password_confirmation.length <6
      flash[:error] = ". Password confirmation should be at least six characters long"
      render 'new'
    else
      @user.instruc = false
      @user.status = "approved"
      if @user.save
        sign_in @user
        flash[:success] = "Welcome to ImagineWare Online Course Platform."
        redirect_to @user
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
    def admin_user
      redirect_to (root_path) unless current_user.admin?
    end

end

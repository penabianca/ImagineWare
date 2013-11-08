class UsersController < ApplicationController
  def show
    @user = User.find(params[:id]) # look up user by unique ID
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
  def create_instructors
    @user = User.new(params[:user])
    #approves you, you will get notified"
    @user.instruc ="true"
    if @user.save
      flash.now[:notice] = "Thank you for signin up as instructors" 
      UserMailer.verify_instructor(@user).deliver
    end
  end
  def create
    @user = User.new(params[:user])
    @user.instruc = "false"
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to ImagineWare Online Course Platform."
      redirect_to  @user
    else
      flash.now[:fail] = "You did not enter all the fields correctly"
      render 'new'
    end
    #redirect_to users_path
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User '#{@user.first_name}' deleted."
    redirect_to instructors_path
  end
  private 
    def user_params
      params.require(:user).permit(:first_name,:last_name, :email, :password,:password_confirmation)
    end
=begin  #{@user.email}
  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    @user.update_attributes!(params[:user])
    flash[:notice] = "#{@user.title} was successfully updated."
    redirect_to user_path(@user)
  end
=end

end

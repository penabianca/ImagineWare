class CreditsController < ApplicationController
  def new
  end
  def create
    @cre = Credit.where(:user_id => session[:stu])
    if @cre.blank?
      @cre = Credit.new_credit
      @yo = params[:credit_form][:credit]
      @cre.credit = @yo
      @cre.user_id = session[:stu]
    else
      @cre = Credit.find_by_user_id(session[:stu])
      @cre.credit += params[:credit_form][:credit].to_i
    end
    if @cre.save
      flash[:success] = "credit added succesfully"
    else
      flash[:error] = "sorry"
    end

  end
end

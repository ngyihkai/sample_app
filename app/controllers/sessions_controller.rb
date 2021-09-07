class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by email: params[:session][:email].downcase
    if @user && @user.authenticate(params[:session][:password])
      if @user.activated
        logged_in @user
        params[:session][:remember_me] == "1" ? remember(@user) : forget(@user)
        redirect_back_or @user
      else
        message = t(:error_acc_unacti)
        flash[:warning] = t(:message)
        redirect_to root_url
      end
    else
      flash.now[:danger] = t(:invalid_email_password_combination)
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to home_path
  end
end

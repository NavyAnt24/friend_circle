class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
              params[:user][:email],
              params[:user][:password])

    if @user
      self.current_user = @user
      redirect_to f_circles_url
    else
      redirect_to new_session_url
    end
  end

  def destroy
    @user = current_user
    @user.session_token = User.generate_session_token
    @user.save
    session[:session_token] = nil
    redirect_to new_session_url
  end

  def forgot_password
    render :forgot
  end

  def send_forgot_email
    @email = params[:user][:email]
    UserMailer.forget_password_email(@email).deliver!
    redirect_to new_session_url
  end

  def reset_password_page
    @user = User.find_by_session_token(params[:session_token])
    render :reset_password_page
  end

  def set_new_password
    @user = User.find_by_session_token(params[:user][:session_token])
    @user.password = params[:user][:password]

    if @user.save
      login_user!(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to :forgot_password
    end
  end

end
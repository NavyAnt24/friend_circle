module ApplicationHelper

  def current_user=(user)
    @current_user = user
    session[:session_token] = user.session_token
  end

  def current_user
    User.find_by_session_token(session[:session_token])
  end

  def login_user!(user)
    new_token = User.generate_session_token
    user.session_token = new_token
    session[:session_token] = new_token
    self.current_user = user
    user.save
  end

  def logout_user!
    user = current_user
    user.session_token = User.generate_session_token
    session[:session_token] = nil
    user.save
  end

  def require_current_user!
    redirect_to new_session_url if current_user.nil?
  end

end

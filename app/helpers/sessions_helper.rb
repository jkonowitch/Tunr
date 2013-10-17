module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def logged_in!
    redirect_to new_session_path unless logged_in?
  end

  def current_user?(user)
    current_user == user
  end
end
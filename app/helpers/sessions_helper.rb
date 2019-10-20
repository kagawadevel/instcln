module SessionsHelper

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def require_logged_in
    unless logged_in?
      flash[:danger] = 'ログインしてください'
      redirect_to new_session_path
    end
  end

  def currnt_user_name
    current_user.name if logged_in?
  end

end

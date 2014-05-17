class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def block_unauthenticated_users
    unless current_user
      if request.xhr?
        render json: {}, status: :unauthorized
      else
        redirect_to sign_in_path, alert: "Please sign in"
      end
    end
  end

  def signed_in?
    current_user.present?
  end

  def current_user
    user = current_user_id && User.find_by_id(current_user_id)
    session['user_id'] = user.id if session['user_id'].blank? && user
    user
  end

  def current_user_id
    session['user_id']
  end

  def sign_in_as(user)
    return_path = session['return_path']
    reset_session
    session.merge!('user_id' => user.id, 'return_path' => return_path)
  end

  def sign_out
    reset_session
  end

  helper_method :current_user, :signed_in?
end

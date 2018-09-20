class ApplicationController < ActionController::Base
  # let rails know that it is a helper method that we can use in views
  helper_method :current_user, :logged_in?

  def current_user
    # find the user in database based on current user 
    # optimization for current user already exist
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    # return true if it have a current user, you will able to check whether a user is logged in or not
    !!current_user
  end

  def require_user
    # for certain actions based there is a logged in user or not
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end
end

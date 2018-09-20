class SessionsController < ApplicationController
  def new

  end

  def create
    # render 'new'
    # debugger

    # remember all out emails our downcase
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # saving the user id to sessions hash which is back to your browser's cookies
      session[:user_id] = user.id
      flash[:success] = "You have successfully logged in"
      redirect_to user_path(user)
    else
      # session is not model back form so will have to give it a message
      # we use flash.now because the regular flash will also flash a message to the next page, we don't want that
      flash.now[:danger] = "There was something wrong with your login information"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end
end
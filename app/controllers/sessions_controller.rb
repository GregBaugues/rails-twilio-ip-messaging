class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to account_path
    else
      flash[:notice] = "Hmmmm... wanna try that again?"
      redirect_to :new_session
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have been signed out"
    redirect_to :new_session
  end

end
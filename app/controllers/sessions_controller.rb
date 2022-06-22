class SessionsController < ApplicationController
    
    skip_before_action :authenticate!, except: :destroy
 
  def new
  end
 
  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to sign_in_path, notice: 'Username or password is incorrect'
    end
  end
 
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end

class SessionsController < ApplicationController
    
    skip_before_action :authenticate!, except: :destroy
 
  def new
    redirect_to root_path if current_user
  end
 
  def create
    @user = User.find_by(username: params[:username])
    if @user.password == params[:password]
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end
 
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end

class UsersController < ApplicationController

  skip_before_action :authenticate!, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        redirect_to root_path, notice: "User was successfully created."
      else
        redirect_to register_path, notice: @user.errors.first.full_message
      end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation, :member_plus)
    end
end

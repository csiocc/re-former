class UsersController < ApplicationController
  before_action :set_user, only: [ :edit, :update, :destroy ]

  def new
    @user = User.new
    @users = User.all
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to new_user_path
    else
      @users = User.all
      render :new, status: :unprocessable_entity
    end
  end


  def update
    if @user.update(user_params)
      redirect_to new_user_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to new_user_path, status: :see_other
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :username, :password)
  end
end

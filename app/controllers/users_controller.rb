class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorise_admin

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'User created successfully'
      redirect_to users_path
    else
      flash[:notice] = 'User failed to create'
      redirect_to users_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = 'User deleted successfully'
      redirect_to users_path
    else
      flash[:notice] = 'User could not be deleted'
      redirect_to users_path
    end
  end

private

  def authorise_admin
    return unless !current_user.admin?
    redirect_to root_path, alert: 'This action can only be performed by an admin user'
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :company)
  end

end

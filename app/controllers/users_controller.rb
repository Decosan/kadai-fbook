class UsersController < ApplicationController
  before_action :require_logged_in, only:[:index,:show]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] ="Sign up!"
      redirect_to users_path
    else
      flash.now[:danger] ="Failed.."
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
end

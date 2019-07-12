class SessionsController < ApplicationController

  def new
  end

  def create
    user=User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id]=user.id
      flash[:success]="logged in!!"
      redirect_to users_path
    else
      flash[:danger]="Failed.."
      render 'new'
    end
  end

  def destroy
  end
end

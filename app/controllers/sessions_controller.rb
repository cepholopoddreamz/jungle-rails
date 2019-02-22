class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
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

private
def user_params
  params.require(:user).permit(
    :email, 
    :password
  )  
end
end

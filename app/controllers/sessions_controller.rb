class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    #@user = User.find_by_email(params[:user][:email]) 
    #stripped_email = strip_whitespace_from_attributes(params[:user][:email])
    #stripped_password = strip_whitespace_from_attributes(params[:user][:password])
    if @user = User.authenticate_with_credentials(params[:user][:email],params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else 
      @user = User.new
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


 #the authenticate_with because of the application of self in the user model methods ------ makes it behave as a class method --- - Instance of User ---  create an instance of User at the same level as this. 
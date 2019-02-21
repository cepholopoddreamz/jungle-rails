class UsersController < ApplicationController
  def create 
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to root_path
    else 
      render :new #that's the form
    end #not doing a redirect or you will loose the error message
  end  

  #get request to display the login form 
  def new
    @user = User.new
  end

  def logout
  end 

  # def destroy
  #   session[:user_id] = nil
  #   redirect_to '/login'
  # end


private

def user_params
  params.require(:user).permit(
    :first_name,
    :last_name,
    :email,
    :password,
    :password_confirmation
  )

end

end
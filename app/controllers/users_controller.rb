class UsersController < ApplicationController
  #include BCrypt #------->>> i added this. is this right?
  def create 
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
      redirect_to root_path
    else 
      @user = User.new
      render :new 
    end 
  end  

  def new
    @user = User.new
  end

  def logout
  end 

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
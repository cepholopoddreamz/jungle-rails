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

# def login
#   @user = User.find_by email(params[:email])
#   if @user.password == params[:password]
#     give_token
#   else
#     redirect_to [:products]
#   end
# end

# def password
#   @password ||= Password.new(password_hash)
# end

# def password=(new_password)
#   @password = Password.create(new_password)
#   self.password_hash = @password #has_secure_password
# end


#  def destroy
#     session[:user_id] = nil
#     redirect_to '/login'
#   end


end
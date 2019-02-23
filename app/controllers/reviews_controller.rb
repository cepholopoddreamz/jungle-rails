class ReviewsController < ApplicationController


def new
  @reviews = Reviews.new
end


def create
#   if @user && @user.authenticate(params[:user][:password])
#     session[:user_id] = @user.id
#     redirect_to root_path
#   else 
#     render :new
#   end
# end
end
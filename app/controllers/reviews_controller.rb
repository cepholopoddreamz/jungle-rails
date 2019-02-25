class ReviewsController < ApplicationController

  before_action :require_login

  def index
    @review = Review.all
  end

  def create
    #raise "Yay, I'm here!"
    product = Product.find(params[:product_id]) 
    review = Review.new(review_params)
    review.product = product
    review.user = current_user
     #user = @current_user
    #user = current_user
    
    if review.save
      redirect_to product_path(params[:product_id]), notice: 'Review created'
      #raise 'maybe this is working'
      #puts 'Review created'
      
    else
      #change this to an error page
      redirect_to product_path(params[:product_id]), notice: review.errors.full_messages
    end
  end


  def destroy
    review = Review.find(params[:id])

    if review.destroy
      redirect_to product_path(params[:product_id]), notice: "Review deleted!"
    else
      redirect_to product_path(params[:product_id]), notice: "Could not delete the review!"
    end
  end



private 

def review_params
  params.require(:review).permit(
    :product,
    :user,
    :description,
    :rating
  )
end 


def require_login
 
  unless current_user
    flash[:error] = "You must be logged in to access this section"
    redirect_to [:login]
  end
end


#white list check? 
def quote_params
  params.require(:quote).permit(:content)
end
#i think this whole thing has to be wrapped, where as before i had this second end,added above private...

end
class ReviewsController < ApplicationController

  def index
    @review = Review.all
  end

  def create
    #raise "Yay, I'm here!"
    product = Product.find(params[:product_id])
    #@review.user = current_user
    
    review = Review.new(review_params)
    review.product = product
    puts params
    
    if review.save
      redirect_to product_path(params[:product_id]), notice: 'Review created'
      #raise 'maybe this is working'
      #puts 'Review created'
      
    else
      redirect_to product_path(params[:product_id]), notice: review.errors.full_messages
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


#white list check? 
def quote_params
  params.require(:quote).permit(:content)
end
#i think this whole thing has to be wrapped, where as before i had this second end,added above private...
end
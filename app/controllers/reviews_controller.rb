class ReviewsController < ApplicationController

  # def index
  #   @reviews = @product.reviews.order(created_at: :desc)
  # end

  def new
    @review = Review.new
  end

  def create
    #raise "Yay, I'm here!"
    product = Product.find(params[:product_id])
    @review = Review.new(review_params)
    @review.product = product
    
    if @review.save
      redirect_to product_path(params[:product_id]), notice: 'Review created'
      #raise 'maybe this is working'
    else
      #raise "not working"
      render :new
    end
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
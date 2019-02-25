class ProductsController < ApplicationController

  

  def index
    @products = Product.all.order(created_at: :desc)
    #@reviews = @product.reviews.order(created_at: :desc)
  end



  def show
    @product = Product.find params[:id]
    #@reviews = Review.new#(review_params)
    @reviews = @product.reviews.order(created_at: :asc)
    @reviews = Review.new
    @reviews.user = current_user
  end

  def new
    @review = Review.new
    #@review.user = current_user
  end

private

end







# def review_params
#   params.require(:review).permit(
#     :product,
#     :user,
#     :description,
#     :rating
#   )
# end

# product: product,
#   quantity: quantity,
#   item_price: product.price,
#   total_price: product.price * quantity









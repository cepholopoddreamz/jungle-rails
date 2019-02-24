class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @reviews = Review.new#(review_params)
    #@product.review = review
    #@reviews = @product.reviews.order(created_at: :desc)
  end

  def create
    @review = Review.new(review_params)
    product = Product.find(params[:id])
    review = review.new(review_params)
    #review.product = product
    @review.user = current_user
  end
end


# def create
#   @review = Review.new(review_params)

#   if @review.save
#     redirect_to [:admin, :reviews], notice: 'Product created!'
#   else
#     render :new
#   end
# end

private 


def review_params
  params.require(:review).permit(
    :product,
    :user,
    :description,
    :rating
  )
end

# product: product,
#   quantity: quantity,
#   item_price: product.price,
#   total_price: product.price * quantity









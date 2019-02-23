class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @reviews = Review.new
  end
end

# quote = Quote.find(params[:quote_id])
# comment = Comment.new(comment_params)
# comment.quote = quote



# def new
#   @review = Review.new
# end





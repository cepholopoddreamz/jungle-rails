class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    raise "Yay, I'm here!"
    @review = Review.new(review_params)

    if @review.save
      redirect_to [:admin, :products], notice: 'Product created!'
    else
      render :new
    end
  end



end


# create_table :reviews do |t|
#   t.references :product
#   t.references :user
#   t.text :description 
#   t.integer :rating

#   t.timestamps null: false


# def new
#   @review = Review.new
# end

# def create
#   puts '----------review create-------'
#   @review = Review.new(review_params)
#   # if review .save
#   #   #redirect_to [:view],  --
#   #   notice: 'Product created!'
#   # else
#   #   notice: 'not saved'
# end


# def index
#   @reviews = Review.order(id: :desc).all
# end
  











# create_table :reviews do |t|
#   t.references :product
#   t.references :user
#   t.text :description 
#   t.integer :rating

#   t.timestamps null: false


# def create
# #   if @user && @user.authenticate(params[:user][:password])
# #     session[:user_id] = @user.id
# #     redirect_to root_path
# #   else 
# #     render :new
# #   end
# # end
# end
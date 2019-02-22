class Admin::CategoriesController < ApplicationController

  http_basic_authenticate_with name: ENV['username'], password: ENV['password']

  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @product = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :category], notice: 'Category Created!'
    else
      render :new
    end
  end

  # def destroy
  #   @category = Category.find params[:id]
  #   @category.destroy
  #   redirect_to [:admin, :category], notice: 'Category deleted!'
  # end

  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end

end

class CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV['NAME'], password: ENV['PASSWORD'], only: [:new, :create] 
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to new_category_path
    else
      render :new
    end 
  end

  def show
    @category = Category.find(params[:id])
    @categories = Category.all
    @articles = Category.find(params[:id]).articles.order('created_at DESC')
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end

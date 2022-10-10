class CategoriesController < ApplicationController
  def index
  end

  def new 
  end

  def create
    @category = Category.new(category_params)
    render plain: ((@category.save) ? "Success" : "Failed" )
  end

  def destroy
    @category = Category.find(params[:id])
    render plain: ((@category.destroy) ? "Success" : "Failed" )

  end

  private
  def category_params
    params.require(:category).permit(:name, :description)
  end
end

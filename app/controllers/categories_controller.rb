class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @courses = Course.where category: @category
  end
end

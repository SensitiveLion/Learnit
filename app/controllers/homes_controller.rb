class HomesController < ApplicationController
  def index
    @course = Course.order("RANDOM()").limit(1)
    @categories = Category.all
  end
end

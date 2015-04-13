class HomesController < ApplicationController
  def index
    @courses = Course.all
  end
end

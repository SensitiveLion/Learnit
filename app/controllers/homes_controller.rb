class HomesController < ApplicationController
  def index
    offset = rand(Course.count)
    @rand_course = Course.offset(offset).first
  end
end

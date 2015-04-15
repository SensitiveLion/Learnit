class SavesController < ApplicationController
  before_action :authenticate_user!
  def create
    @favorite = Save.new
    @course = Course.find(params[:course_id])
    @favorite.course = @course
    @favorite.user = current_user

    if @favorite.save
      flash[:notice] = "Save submitted."
      redirect_to course_path(@course)
    else
      flash[:notice] = "You have already saved this game"
      redirect_to course_path(@course)
    end
  end
end

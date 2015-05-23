class LearnipediasController < ApplicationController
  def show
    @learnipedia = Learnipedia.find(params[:id])
    @lessons = @learnipedia.lessons.order(:created_at)
  end

  def destroy
    @learnipedia = Learnipedia.find(params[:id])
    @learnipedia.destroy
    flash[:notice] = 'course deleted.'
    redirect_to root_path
  end
end

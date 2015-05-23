class LexiconsController < ApplicationController
  def show
    @lexicon = Lexicon.find(params[:id])
    @lessons = LexiconLesson.where(lexicon_id: params[:id])
  end

  def destroy
    @lexicon = Lexicon.find(params[:id])
    @lexicon.destroy
    flash[:notice] = 'course deleted.'
    redirect_to root_path
  end
end

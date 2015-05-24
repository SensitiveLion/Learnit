class HomesController < ApplicationController
  def index
    @lexicon = Lexicon.order("RANDOM()").limit(1)
    @categories = Category.all
  end
end

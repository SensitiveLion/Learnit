class SearchesController < ApplicationController
  def index
    @google = Search.new.google("ruby mechinize")
  end
end

class SearchesController < ApplicationController
  def index
    @google = Search.google(params[:query])
    @bing = Search.bing(params[:query])
    @yahoo = Search.yahoo(params[:query])
    @ask = Search.ask(params[:query])
    @aol = Search.aol(params[:query])
    @wow = Search.wow(params[:query])
  end
end

class LexiconSearchesController < ApplicationController
  def index
    @lexicon = Lexicon.find(params[:lexicon_id])
    @name = @lexicon.title
    @google = Search.google_parse(@name)
    @bing = Search.bing_parse(@name)
    @yahoo = Search.yahoo_parse(@name)
    @ask = Search.ask_parse(@name)
    @aol = Search.aol_parse(@name)
    @wow = Search.wow_parse(@name)
  end
end

class ThingsController < ApplicationController
  def index
    @thing = Thing.order("RANDOM()").limit(1)
    @name = @thing[0].name
    @google = Search.google_parse(@name)
    @bing = Search.bing_parse(@name)
    @yahoo = Search.yahoo_parse(@name)
    @ask = Search.ask_parse(@name)
    @aol = Search.aol_parse(@name)
    @wow = Search.wow_parse(@name)
  end
end

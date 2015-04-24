class ThingsController < ApplicationController
  def index
    @thing = Thing.order("RANDOM()").limit(1)
    @name = @thing[0].name
    @google = Search.google(@name)
    @bing = Search.bing(@name)
    @yahoo = Search.yahoo(@name)
    @ask = Search.ask(@name)
    @aol = Search.aol(@name)
    @wow = Search.wow(@name)
  end
end

class SearchesController < ApplicationController
  def index
    @course = Course.find(params[:course_id])
    @name = @course.name
    @google = Search.google_parse(@name)
    @bing = Search.bing_parse(@name)
    @yahoo = Search.yahoo_parse(@name)
    @ask = Search.ask_parse(@name)
    @aol = Search.aol_parse(@name)
    @wow = Search.wow_parse(@name)
  end
end

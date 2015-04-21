class SearchesController < ApplicationController
  def index
    @course = Course.find(params[:course_id])
    @name = @course.name
    @google = Search.google(@name)
    @bing = Search.bing(@name)
    @yahoo = Search.yahoo(@name)
    @ask = Search.ask(@name)
    @aol = Search.aol(@name)
    @wow = Search.wow(@name)
  end
end

class UsersController < ApplicationController
  before_action :authenticate_admin!, only: [:update]

  def show
    @user = User.find(params[:id])
    @lessons = Lesson.all
  end
end

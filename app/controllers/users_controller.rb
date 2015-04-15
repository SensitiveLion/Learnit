class UsersController < ApplicationController
  before_action :authenticate_admin!, only: [:update]

  def show
    @user = User.find(params[:id])
    @save = Save.where user: current_user
  end
end

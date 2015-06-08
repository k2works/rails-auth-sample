class DashBoardController < ApplicationController
  def index
    @users = User.all
  end
end

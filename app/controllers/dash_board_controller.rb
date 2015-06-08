class DashBoardController < ApplicationController
  def index
    @users = User.all
    @belongs = Belong.all
  end
end

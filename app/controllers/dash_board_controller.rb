class DashBoardController < ApplicationController
  def index
    @users = User.all
    @belongs = Belong.all

    if @belong.nil?
      @belong = Belong.new
    end

    @selected_belong = Belong.where('id =?',1)
  end
end

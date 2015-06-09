class DashBoardController < ApplicationController
  def index
    @users = User.all
    @belongs = Belong.all

    if @belong.nil?
      @belong = Belong.new
    end

    @selected_belong = Belong.where('id =?',1)

    @users.each do |user|
      belong = Belong.find(user.belong_id)
      if belong.name.present?
        user.belong = belong.name
      end
    end
  end
end

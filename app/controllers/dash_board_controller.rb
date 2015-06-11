class DashBoardController < ApplicationController
  def index
    @users = User.all
    @belongs = Belong.all

    if @belong.nil?
      @belong = Belong.new
    end

    select_id = 1
    @selected_belong = Belong.where('id =?',select_id)

    @users.each do |user|
      belong = Belong.find(user.belong_id)
      if belong.name.present?
        user.belong_name = belong.name
      end
    end
  end
end

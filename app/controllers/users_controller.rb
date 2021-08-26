class UsersController < ApplicationController
  before_action :laod_user, only: :show

  def show
    @user = User.find_by id: params[:id]
  end

  def new
  end
end

class UsersController < ApplicationController
  def index
  	@users = User.all.paginate(page: params[:page])
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  end
end

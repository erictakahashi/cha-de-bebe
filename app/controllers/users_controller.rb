class UsersController < ApplicationController
  def index
    render "index"
  end

  def new
    @user = User.new
  end

  def create
  end


end

class UsersController < ApplicationController
  def index
    render "index"
  end

  def new
    @user = User.new
  end

  def create
  	@user = User.new(params_user(params))
  	@user.save
  end

  private
  def params_user(params)
  	params.require(:user).permit(:father_name,
  								:mother_name,
  								:child_name,
  								:event_date,
  								:message)
  end
end

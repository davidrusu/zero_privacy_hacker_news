class UserController < ApplicationController
  def create
    @user = User.new(params[:name])
    if @user.save
      redirect_to "/index"
    end
  end
end

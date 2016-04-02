class UserController < ApplicationController
  layout nil
  layout 'application', :except => :view

  # skip the csrf check since we are just doing a REST api
  skip_before_filter :verify_authenticity_token
  
  def index
    @user = User.find_by username: params[:username]
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      logger.debug "User session #{session[:user_id]}"
      render json: { message: "Auth successful"}
    else
      logger.debug "Auth failed"
      render json: { message: "Auth failed"}
    end
  end
  
  def create
    @user = User.new(
      username: params[:username],
      password: params[:password]
    )
    
    if @user.save
      render json: @user.as_json
    else
      render json: { message: "Failed to create user" }
    end
  end

end

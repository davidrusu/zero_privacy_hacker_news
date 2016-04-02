class UserController < ApplicationController
  layout nil
  layout 'application', :except => :view

  # skip the csrf check since we are just doing a REST api
  skip_before_filter :verify_authenticity_token
  
  def index
    @user = User.find_by username: params[:username]
    if @user && @user.authenticate(params[:password])
      session_id = Session.create_session @user
      logger.debug "User session #{session_id}"
      render json: {
               message: "Auth successful",
               session: session_id
             }
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
      
      session_id = Session.create_session @user
      render json: {
               user: @user.as_json,
               session: session_id
             }
    else
      render json: { message: "Failed to create user" }
    end
  end

end

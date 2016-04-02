class AuthRequiredController < ApplicationController
  before_action :auth_required

  def auth_required
    user = Session.get_user params[:session]
    if user.nil?
      render json: { message: "Invalid session" }
    else
      @current_user = user
    end
  end
end

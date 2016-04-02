class InteractionController < AuthRequiredController
  layout nil
  layout 'application', :except => :view

  # skip the csrf check since we are just doing a REST api
  skip_before_filter :verify_authenticity_token

  def index
    # get a list of users who have interacted with the given item
    interactions = Interaction.where(hn_item: params[:item]).map { |i| i.as_json }

    render json: interactions
  end

  def create
    interaction = Interaction.new(
      user: @current_user,
      hn_item: params[:item]
    )
    if interaction.save
      render json: { message: "Interaction created" }
    else
      render json: { message: "Failed to create interaction" }
    end
  end
end

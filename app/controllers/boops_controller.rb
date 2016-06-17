class BoopsController < ApplicationController
  protect_from_forgery
  skip_before_action :verify_authenticity_token, if: :json_request?

  def create
    # Extract the parameters we care about
    @boop = Boop.new(boop_params)
    if @boop.save
      render json: {
        success: "ok"
      }
    else
      render status: 422
    end
  end

  def new
  end

  def index
    if admin_user_signed_in?
      @boops = Boop.limit(100).order(created_at: :desc)
    else
      @boops = Boop.joins(:box).where("boxes.private" => false).limit(100).order(created_at: :desc)
      # Discard any private objects too
      public_boops = []
      @boops.each do |b|
        public_boops.push(b) unless b.print.box.private?
      end
      @boops = public_boops
    end
  end

protected
  def json_request?
    request.format.json?
  end

  def boop_params
    params.require(:boop).permit(:box_id, :print_id, :created_at)
  end
end

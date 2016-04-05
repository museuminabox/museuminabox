class ThingsController < ApplicationController

  def show
    @thing = Thing.find(params[:id])
    @prints = @thing.prints.includes(:box)
    if admin_user_signed_in? || !@thing.collection.private
      render
    else
      not_found
    end
  end

  def index
    if admin_user_signed_in?
      @things = Thing.all().order(:id)
    else
      # Remove any private collections
      @things = Thing.joins(:collection).where("collections.private" => false).order(:id)
    end
  end

end

class ThingsController < ApplicationController

  def show
    @thing = Thing.find(params[:id])
    @prints = @thing.prints.includes(:box)
  end

  def index
    @things = Thing.limit(100).order(:id)
  end

end

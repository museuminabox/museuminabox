class ThingsController < ApplicationController

  def show
    @thing = Thing.find(params[:id])
    @box = Box.find(params[:id])
  end

  def index
    @things = Thing.limit(100).order(:id)
  end

end

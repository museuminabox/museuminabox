class ThingsController < ApplicationController

  def show
    @thing = Thing.find(params[:id])
  end

end

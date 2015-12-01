class HomeController < ApplicationController

  def show
    @boxes = Box.limit(100).order(:id)
    @institution = Institution.find(params[:id])
  end

end

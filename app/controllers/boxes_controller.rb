class BoxesController < ApplicationController

  def show
    @box = Box.find(params[:id])
    @prints = @box.prints.includes(:thing)
  end

  def index
    @boxes = Box.limit(100).order(:id)
  end

end

class PrintsController < ApplicationController

  def index
    @prints = Print.limit(100).order(:id)
  end

  def show
    @print = Print.find(params[:id])
  end

end

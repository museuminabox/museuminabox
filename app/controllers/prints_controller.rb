class PrintsController < ApplicationController

  def index
    if admin_user_signed_in?
      @prints = Print.all().order(:id)
    else
      # Remove any private prints
      @prints = Print.joins(:box).where("boxes.private" => false).order(:id)
    end
  end

  def show
    @print = Print.find(params[:id])
    if admin_user_signed_in? || !@print.box.private
      render
    else
      not_found
    end
  end

end

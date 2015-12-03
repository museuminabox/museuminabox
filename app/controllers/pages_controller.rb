class PagesController < ApplicationController

  def home
    @boxes = Box.all
  end

  def about
  end

  def sowhat
  end

  def help
  end

  def contact
  end
    
end

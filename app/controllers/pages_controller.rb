class PagesController < ApplicationController

  def home
    if admin_user_signed_in?
      @boxes = Box.all
    else
      @boxes = Box.all.where(:private => false)
    end
  end

  def about
  end

  def sowhat
  end

  def help
  end

  def contact
  end

  def discussion
  end
     
  def thebrain
  end

end

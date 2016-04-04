require 'csv'

class BoxesController < ApplicationController

  def show
    @box = Box.find(params[:id])
    @prints = @box.prints.includes(:thing)
    if admin_user_signed_in? || !@box.private
      render
    else
      not_found
    end
  end

  def list
    @box = Box.find(params[:id])
    @prints = @box.prints.includes(:thing)
    # Render it to a CSV
    results = CSV.generate(:force_quotes => true) do |csv|
      @prints.each do |p|
        csv << [p.thing.name, object_url(p.thing), p.id, p.brain_filename_audio, p.brain_filename_video]
      end
    end
    render plain: results
  end

  def index
    if admin_user_signed_in?
      @boxes = Box.limit(100).order(:id)
    else
      # Remove any private boxes
      @boxes = Box.limit(100).where(:private => false).order(:id)
    end
    respond_to do |format|
      format.html
      format.json do
        items = @boxes.collect { |b| { :id => b.id, :url => box_url(b), :name => b.collection.name } }
        render text: items.to_json
      end
    end
  end

end

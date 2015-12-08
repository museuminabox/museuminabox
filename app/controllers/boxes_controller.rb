require 'csv'

class BoxesController < ApplicationController

  def show
    @box = Box.find(params[:id])
    @prints = @box.prints.includes(:thing)
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
    @boxes = Box.limit(100).order(:id)
  end

end

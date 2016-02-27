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
        csv << [p.thing.name, print_url(p), p.id, p.brain_filename_audio, p.brain_filename_video]
      end
    end
    render plain: results
  end

  def index
    @boxes = Box.limit(100).order(:id)
    respond_to do |format|
      format.html
      format.json do
        items = @boxes.collect { |b| { :id => b.id, :url => box_url(b), :name => b.collection.name } }
        render text: items.to_json
      end
    end
  end

end

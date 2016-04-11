require 'csv'

class BoxesController < ApplicationController

  def show
    @box = Box.find(params[:id])
    @prints = @box.prints.includes(:thing)
    respond_to do |format|
      format.html do
        if admin_user_signed_in? || !@box.private
          render
        else
          not_found
        end
      end
      format.json do
        render text: @box.to_json
      end
    end
  end

  def list
    @box = Box.find(params[:id])
    @prints = @box.prints.includes(:thing)
    respond_to do |format|
      format.html do
        if admin_user_signed_in? || !@box.private
          render
        else
          not_found
        end
      end
      format.json do
        results = @prints.collect { |p| { :id => p.id, :name => p.thing.name, :url => object_url(p.thing), :image_url => URI.join(request.original_url, p.image).to_s, :brain_filename_audio => p.brain_filename_audio, :brain_filename_video => p.brain_filename_video, :brain_url_audio => p.brain_url_audio, :brain_url_video => p.brain_url_video } }
        render text: results.to_json
      end
      format.csv do
        # Render it to a CSV
        results = CSV.generate(:force_quotes => true) do |csv|
          @prints.each do |p|
            csv << [p.thing.name, object_url(p.thing), p.id, p.brain_filename_audio, p.brain_filename_video, p.brain_url_audio, p.brain_url_video]
          end
        end
        render plain: results
      end
    end
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
        @boxes = Box.all.order(:id)
        items = @boxes.collect { |b| { :id => b.id, :url => box_url(b), :name => b.collection.name, :brain_type => b.brain_type } }
        render text: items.to_json
      end
    end
  end

end

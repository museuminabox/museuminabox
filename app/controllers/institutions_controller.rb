class InstitutionsController < ApplicationController

  def index
    @institutions = Institution.limit(100).order(:id)
  end

  def show
    @institution = Institution.find(params[:id])
  end

end

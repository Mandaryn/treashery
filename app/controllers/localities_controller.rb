class LocalitiesController < ApplicationController
  def show
    @locality = Locality.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @locality }
    end
  end

  def search
    @locality = Locality.search(params[:search]).first

    respond_to do |format|
      format.html
      format.json { render json: @locality }
    end
  end
end

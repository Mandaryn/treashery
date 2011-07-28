class SpotsController < ApplicationController
  def index
    @spots = Spot.bounded(params[:swLng], params[:swLat], params[:neLng], params[:neLat])

    respond_to do |format|
      format.html { @spots = @spots.page(params[:page])}
      format.json { render json: @spots }
      format.js { @spots = @spots.page(params[:page])}
    end
  end

  def show
    @spot = Spot.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @spot }
      format.js
    end
  end

  def new
    @spot = Spot.new(:lat => params[:lat], :lng => params[:lng])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @spot }
      format.js
    end
  end

  def edit
    @spot = Spot.find(params[:id])
  end

  def create
    @spot = Spot.new(params[:spot])
    respond_to do |format|
      if @spot.save
        format.html { redirect_to @spot, notice: 'Spot was successfully created.' }
        format.json { render json: @spot, status: :created, location: @spot }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @spot.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def update
    @spot = Spot.find(params[:id])

    respond_to do |format|
      if @spot.update_attributes(params[:spot])
        format.html { redirect_to @spot, notice: 'Spot was successfully updated.' }
        format.json { head :ok }
        format.js
      else
        format.html { render action: "edit" }
        format.json { render json: @spot.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def destroy
    @spot = Spot.find(params[:id])
    @spot.destroy

    respond_to do |format|
      format.html { redirect_to spots_url }
      format.json { head :ok }
      format.js
    end
  end
end

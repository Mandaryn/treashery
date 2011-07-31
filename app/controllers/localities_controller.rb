class LocalitiesController < ApplicationController
  def index
    @localities = Locality.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @localities }
    end
  end

  def show
    @locality = Locality.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @locality }
    end
  end

  def new
    @locality = Locality.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @locality }
    end
  end

  def edit
    @locality = Locality.find(params[:id])
  end

  def create
    @locality = Locality.new(params[:locality])

    respond_to do |format|
      if @locality.save
        format.html { redirect_to @locality, notice: 'Locality was successfully created.' }
        format.json { render json: @locality, status: :created, location: @locality }
      else
        format.html { render action: "new" }
        format.json { render json: @locality.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @locality = Locality.find(params[:id])

    respond_to do |format|
      if @locality.update_attributes(params[:locality])
        format.html { redirect_to @locality, notice: 'Locality was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @locality.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @locality = Locality.find(params[:id])
    @locality.destroy

    respond_to do |format|
      format.html { redirect_to localities_url }
      format.json { head :ok }
    end
  end
end

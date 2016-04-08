class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  def brand_locations
    @menu_item = MenuItem.find(params[:menu_item_id])
    @brand = @menu_item.brand
    @locations = @brand.locations
  end

  def index
    @locations = Location.all
  end

  def show
    @day_parts = @location.day_parts
  end

  def new
    @location = Location.new
    @location.day_parts.build
    @brands = Brand.all.map { |brand| [brand.name, brand.id] }
  end

  def edit
    @location.day_parts.build
  end

  def create
    @location = Location.new(location_params)
    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully created.' }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:name, :brand_id, day_parts_attributes: [:id, :name, :_destroy])
    end
end

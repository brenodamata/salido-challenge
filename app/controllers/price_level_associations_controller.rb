class PriceLevelAssociationsController < ApplicationController
  before_action :set_price_level_association, only: [:show, :edit, :update, :destroy]
  before_action :set_location

  def index
    @price_level_associations = @location.price_level_associations
  end

  def new
    @price_level_association = PriceLevelAssociation.new
  end

  def edit
  end

  def create
    @price_level_association = @location.price_level_associations.new(price_level_association_params)
    respond_to do |format|
      if @price_level_association.save
        format.html { redirect_to location_price_level_associations_path(@location), notice: 'Price level association was successfully created.' }
        format.json { render :show, status: :created, location: @price_level_association }
      else
        format.html { render :new }
        format.json { render json: @price_level_association.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @price_level_association.update(price_level_association_params)
        format.html { redirect_to location_price_level_associations_path(@location), notice: 'Price level association was successfully updated.' }
        format.json { render :show, status: :ok, location: @price_level_association }
      else
        format.html { render :edit }
        format.json { render json: @price_level_association.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @price_level_association.destroy
    respond_to do |format|
      format.html { redirect_to location_price_level_associations_path(@location), notice: 'Price level association was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_price_level_association
      @price_level_association = PriceLevelAssociation.find(params[:id])
    end

    def set_location
      @location = Location.find(params[:location_id])
    end

    def price_level_association_params
      params.require(:price_level_association).permit(:price_level_id, :order_type_id, :day_part_id)
    end
end

require 'mongo'

class PricesController < ApplicationController
  before_action :set_price, only: [:show, :edit, :update, :destroy]
  before_action :set_menu_item, only: [:show, :edit, :update, :destroy, :create]

  def search
    unless params[:search][:menu_item_id].empty?
      @item = MenuItem.find(params[:search][:menu_item_id])

      if params[:search][:location_id].empty?
        loc = false
      else
        @location = Location.find(params[:search][:location_id])
        loc = true
        if params[:search][:day_part_id].empty?
          day_p = false
        else
          @day_part = DayPart.find(params[:search][:day_part_id])
          day_p = true
        end
      end

      if params[:search][:order_type_id].empty?
        ot = false
      else
        @order_type = OrderType.find(params[:search][:order_type_id])
        ot = true
      end

      if day_p
        pla = @location.price_level_associations.where(day_part: @day_part, order_type: @order_type)
        @price = pla.first.price_level.prices.first
      end

      if !day_p or @price.nil?
        pla = @location.price_level_associations.where(order_type: @order_type)
        @price = pla.first.price_level.prices.first
      end

    else
      respond_to do |format|
        format.html { render :search, flash: { error: "error message" }}
        format.json { render json: { :error => @prices.errors } }
      end
    end
  end

  def results

  end

  def lookup

  end

  def index
    @prices = Price.all
  end

  def show
  end

  def new
    @price = Price.new
    @menu_item = MenuItem.find(params[:menu_item_id])
    @price_levels = @menu_item.brand.price_levels
  end

  def edit
  end

  def create
    prices = params[:price][:value]

    # validatios
    if Price.validate_bulk(params[:price], @menu_item).nil?

      new_prices = []
      prices.each_with_index do |price, i|
        params[:price][:value] = price
        params[:price][:price_level_id] = @menu_item.brand.price_levels[i].id.to_s
        new_prices << {insert_one: @menu_item.prices.new(price_params).attributes}
      end

      Price.collection.bulk_write(new_prices)
      respond_to do |format|
        format.html { redirect_to  menu_item_path(@menu_item), notice: 'Price was successfully created.' }
        format.json { render :show, status: :created, location: @price }
      end
    else
      respond_to do |format|
        format.json { render json: @price.errors, status: :unprocessable_entity }
        format.html { redirect_to  new_menu_item_price_path(@menu_item), flash: { error: Price.validate_bulk(params[:price], @menu_item)[0] }}
      end
    end
  end

  def update
    respond_to do |format|
      if @price.update(price_params)
        format.html { redirect_to  menu_item_path(@menu_item), notice: 'Price was successfully updated.' }
        format.json { render :show, status: :ok, location: @price }
      else
        format.html { render :edit }
        format.json { render json: @price.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @price.destroy
    respond_to do |format|
      format.html { redirect_to menu_item_path(@menu_item), notice: 'Price was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_price
      @price = Price.find(params[:id])
    end

    def set_menu_item
      @menu_item = MenuItem.find(params[:menu_item_id])
    end

    def price_params
      params.require(:price).permit(:value, :menu_item_id, :location_id, :order_type_id, :day_part_id, :price_level_id)
    end
end

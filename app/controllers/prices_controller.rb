class PricesController < ApplicationController
  before_action :set_price, only: [:show, :edit, :update, :destroy]
  before_action :set_menu_item_location, only: [:new, :edit, :create, :show, :update]
  before_action :set_menu_item_location, except: [:search, :results, :index]

  def search
    puts params
    @location = Location.find(params[:price][:location_id])
    @order_type = OrderType.find(params[:price][:order_type_id])
    @day_part = DayPart.find(params[:price][:day_part_id]) unless params[:price][:day_part_id].empty?
    @item = MenuItem.find(params[:price][:menu_item_id])
    @prices = @item.prices.where(location_id: @location.id.to_s, order_type_id: @order_type.id.to_s)
    # @prices = Price.find(:all, :conditions => ["name LIKE %?%",location])
  end

  def results

  end

  def index
    @prices = Price.all
  end

  def show
  end

  def new
    @price = Price.new
    @menu_item = MenuItem.find(params[:menu_item_id])
    @location = Location.find(params[:location_id])
  end

  def edit
  end

  def create
    @price = Price.new(price_params)
    @price.menu_item = @menu_item
    @price.location = @location

    respond_to do |format|
      if @price.save
        format.html { redirect_to  menu_item_path(@menu_item), notice: 'Price was successfully created.' }
        format.json { render :show, status: :created, location: @price }
      else
        format.html { render :new }
        format.json { render json: @price.errors, status: :unprocessable_entity }
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

    def set_menu_item_location
      @menu_item = MenuItem.find(params[:menu_item_id])
      @location = Location.find(params[:location_id])
    end

    def price_params
      params.require(:price).permit(:value, :menu_item_id, :location_id, :order_type_id, :day_part_id, :price_level_id)
    end
end

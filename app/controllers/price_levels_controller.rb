class PriceLevelsController < ApplicationController
  before_action :set_price_level, only: [:show, :edit, :update, :destroy]

  # GET /price_levels
  # GET /price_levels.json
  def index
    @price_levels = PriceLevel.all
  end

  # GET /price_levels/1
  # GET /price_levels/1.json
  def show
  end

  # GET /price_levels/new
  def new
    @price_level = PriceLevel.new
  end

  # GET /price_levels/1/edit
  def edit
  end

  # POST /price_levels
  # POST /price_levels.json
  def create
    @price_level = PriceLevel.new(price_level_params)

    respond_to do |format|
      if @price_level.save
        format.html { redirect_to @price_level, notice: 'Price level was successfully created.' }
        format.json { render :show, status: :created, location: @price_level }
      else
        format.html { render :new }
        format.json { render json: @price_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /price_levels/1
  # PATCH/PUT /price_levels/1.json
  def update
    respond_to do |format|
      if @price_level.update(price_level_params)
        format.html { redirect_to @price_level, notice: 'Price level was successfully updated.' }
        format.json { render :show, status: :ok, location: @price_level }
      else
        format.html { render :edit }
        format.json { render json: @price_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /price_levels/1
  # DELETE /price_levels/1.json
  def destroy
    @price_level.destroy
    respond_to do |format|
      format.html { redirect_to price_levels_url, notice: 'Price level was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_price_level
      @price_level = PriceLevel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def price_level_params
      params.require(:price_level).permit(:name, :brand_id)
    end
end

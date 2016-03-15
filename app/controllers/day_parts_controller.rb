class DayPartsController < ApplicationController
  before_action :set_day_part, only: [:show, :edit, :update, :destroy]

  def index
    @day_parts = DayPart.all
  end

  def show
  end

  def new
    @day_part = DayPart.new
  end

  def edit
  end

  def create
    @day_part = DayPart.new(day_part_params)

    respond_to do |format|
      if @day_part.save
        format.html { redirect_to @day_part, notice: 'Day part was successfully created.' }
        format.json { render :show, status: :created, location: @day_part }
      else
        format.html { render :new }
        format.json { render json: @day_part.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @day_part.update(day_part_params)
        format.html { redirect_to @day_part, notice: 'Day part was successfully updated.' }
        format.json { render :show, status: :ok, location: @day_part }
      else
        format.html { render :edit }
        format.json { render json: @day_part.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @day_part.destroy
    respond_to do |format|
      format.html { redirect_to day_parts_url, notice: 'Day part was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_day_part
      @day_part = DayPart.find(params[:id])
    end

    def day_part_params
      params.require(:day_part).permit(:name, :location_id)
    end
end

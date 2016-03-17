class SalidosController < ApplicationController

	def index
		
	end

	def brands
		@brands = Brand.order('name ASC').all
	end

	def locations
		@brand = Brand.find(params[:brand_id])
		@locations = @brand.locations
	end

	def order_types
		@location = Location.find(params[:location_id])
		@brand = @location.brand
		@order_types = @brand.order_types
	end

	def prices
		@location = Location.find(params[:location_id])
		@brand = @location.brand
		@day_parts = @location.day_parts
		@menu_items = @brand.menu_items
		debugger
	end
end
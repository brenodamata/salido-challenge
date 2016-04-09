class Search
  include Mongoid::Document

  field :menu_item_id, type: Integer
  field :location_id, type: Integer
  field :order_type_id, type: Integer
  field :day_part_id, type: Integer
  field :price_level_id, type: Integer

  def self.validate(search)
    errors = []
    errors << "Select a brand." if search[:brand_id].empty?
    errors << "Select a menu itme." if search[:menu_item_id].empty?
    errors << "Select a location." if search[:location_id].empty?
    errors << "Select a type of order." if search[:order_type_id].empty?
    errors.empty? ? nil : errors
  end
end

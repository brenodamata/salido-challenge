class Search
  include Mongoid::Document

  field :menu_item_id, type: Integer
  field :location_id, type: Integer
  field :order_type_id, type: Integer
  field :day_part_id, type: Integer
  field :price_level_id, type: Integer
end

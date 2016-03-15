class Price
  include Mongoid::Document
  field :value, type: Float
  field :menu_item_id, type: Integer
  field :location_id, type: Integer
  field :order_type_id, type: Integer
  field :day_part_id, type: Integer

  belongs_to :menu_item
  belongs_to :location
  belongs_to :order_type
  belongs_to :day_part
end

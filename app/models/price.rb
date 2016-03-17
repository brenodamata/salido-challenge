class Price
  include Mongoid::Document
  field :value, type: Float
  field :menu_item_id, type: Integer
  field :location_id, type: Integer
  field :order_type_id, type: Integer
  field :day_part_id, type: Integer
  field :price_level_id, type: Integer

  belongs_to :menu_item
  belongs_to :location
  belongs_to :order_type
  belongs_to :day_part
  belongs_to :price_level

  validates_presence_of :value
  validates_presence_of :order_type_id
  validates_presence_of :location_id
  validates_presence_of :price_level_id

  validates :menu_item, :uniqueness => {:scope => [:location_id, :price_level_id, :order_type_id, :day_part_id]}
end

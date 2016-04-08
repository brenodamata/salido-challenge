class Price
  include Mongoid::Document
  field :value, type: Float
  field :menu_item_id, type: Integer
  # field :location_id, type: Integer
  # field :order_type_id, type: Integer
  # field :day_part_id, type: Integer
  field :price_level_id, type: Integer

  belongs_to :menu_item
  # belongs_to :location
  # belongs_to :order_type
  # belongs_to :day_part
  belongs_to :price_level

  validates_presence_of :value
  # validates_presence_of :order_type_id
  # validates_presence_of :location_id
  validates_presence_of :price_level_id

  # validates :menu_item, :uniqueness => {:scope => [:location_id, :order_type_id, :day_part_id]}
  validates :menu_item, uniqueness: { scope: :price_level_id }

  def self.validate_bulk(price, menu_item)
    errors = []
    errors << "Insert a price for every price level." if price[:value].size != menu_item.brand.price_levels.size
    price[:value].each { |p| errors << "Type in a price." if p.empty? }
    # errors << "Please choose a location." if price[:location_id].empty?
    # errors << "Please choose an oder type" if price[:order_type_id].empty?
    errors.empty? ? nil : errors
  end
# TODO: validation for only one price for price levels
end

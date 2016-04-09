class Price
  include Mongoid::Document
  field :value, type: Float
  field :menu_item_id, type: Integer
  field :price_level_id, type: Integer

  belongs_to :menu_item
  belongs_to :price_level

  validates_presence_of :value
  validates_presence_of :price_level_id
  
  # TODO: validation for only one price for price levels
  validates :menu_item_id, uniqueness: { scope: :price_level_id }

  def self.validate_bulk(price, menu_item)
    errors = []
    errors << "Insert a price for every price level." if price[:value].size != menu_item.brand.price_levels.size
    price[:value].each { |p| errors << "Type in a price." if p.empty? }
    errors.empty? ? nil : errors
  end
end

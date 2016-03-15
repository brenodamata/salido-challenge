class DayPart
  include Mongoid::Document
  field :name, type: String
  field :location_id, type: Integer

  belongs_to :location
  has_many :price_levels
  has_many :prices
end

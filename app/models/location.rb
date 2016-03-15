class Location
  include Mongoid::Document
  field :name, type: String
  field :brand_id, type: Integer

  belongs_to :brand
  has_many :day_parts
  has_many :price_levels
  has_many :prices
end

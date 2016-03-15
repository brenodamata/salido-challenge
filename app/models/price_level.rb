class PriceLevel
  include Mongoid::Document
  field :name, type: String
  field :brand_id, type: Integer
  field :location_id, type: Integer
  field :day_part_id, type: Integer

  belongs_to :brand
  belongs_to :location
  belongs_to :day_part
end

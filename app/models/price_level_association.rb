class PriceLevelAssociation
  include Mongoid::Document
  field :price_level_id, type: Integer
  field :location_id, type: Integer
  field :order_type_id, type: Integer
  field :day_part_id, type: Integer

  belongs_to :price_level
  belongs_to :location
  belongs_to :order_type
  belongs_to :day_part
# TODO: add validations so that there is an uniqueness with the scope of all models involved.
end

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

  validates :location_id, uniqueness: { scope: [:order_type_id, :day_part_id],
                                        message: "This price level association already exists." }
  validates :price_level_id, presence: true
  validates :order_type_id, presence: true
end

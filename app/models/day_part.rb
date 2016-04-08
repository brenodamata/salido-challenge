class DayPart
  include Mongoid::Document
  field :name, type: String
  field :location_id, type: Integer

  belongs_to :location
  has_many :price_levels_associations, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :location_id
end

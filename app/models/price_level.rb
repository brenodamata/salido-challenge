class PriceLevel
  include Mongoid::Document
  field :name, type: String
  field :brand_id, type: Integer

  belongs_to :brand
  has_many :prices, dependent: :destroy
  has_many :price_levels_associations, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :brand_id
end

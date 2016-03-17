class Location
  include Mongoid::Document
  field :name, type: String
  field :brand_id, type: Integer

  belongs_to :brand
  has_many :day_parts, dependent: :destroy
  has_many :prices, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :brand_id

  accepts_nested_attributes_for :day_parts, 
  															reject_if: proc { |attributes| attributes['name'].blank? },
                                allow_destroy: true
end

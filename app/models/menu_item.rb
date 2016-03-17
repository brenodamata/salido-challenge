class MenuItem
  include Mongoid::Document
  field :name, type: String
  field :brand_id, type: Integer

  belongs_to :brand
  has_many :prices

  validates_presence_of :name
  validates_presence_of :brand_id
end

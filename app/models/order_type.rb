class OrderType
  include Mongoid::Document
  field :name, type: String
  field :brand_id, type: Integer

  belongs_to :brand

  validates_presence_of :name
  validates_presence_of :brand_id
end

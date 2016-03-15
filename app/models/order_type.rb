class OrderType
  include Mongoid::Document
  field :name, type: String
  field :brand_id, type: Integer

  belongs_to :brand
  has_many :prices
end

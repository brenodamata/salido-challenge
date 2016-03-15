class Brand
  include Mongoid::Document
  field :name, type: String
  has_many :locations
  has_many :order_types
  has_many :price_levels
  has_many :menu_items
end

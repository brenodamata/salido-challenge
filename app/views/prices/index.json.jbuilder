json.array!(@prices) do |price|
  json.extract! price, :id, :price, :menu_item_id, :location_id, :order_type_id, :day_part_id
  json.url price_url(price, format: :json)
end

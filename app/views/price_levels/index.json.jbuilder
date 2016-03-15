json.array!(@price_levels) do |price_level|
  json.extract! price_level, :id, :name, :brand_id
  json.url price_level_url(price_level, format: :json)
end

json.array!(@price_level_associations) do |price_level_association|
  json.extract! price_level_association, :id
  json.url price_level_association_url(price_level_association, format: :json)
end

json.array!(@locations) do |location|
  json.extract! location, :id, :name, :brand
  json.url location_url(location, format: :json)
end

json.array!(@day_parts) do |day_part|
  json.extract! day_part, :id, :name, :location_id
  json.url day_part_url(day_part, format: :json)
end

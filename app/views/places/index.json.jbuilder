json.array!(@places) do |place|
  json.extract! place, :id, :name, :code
  json.url place_url(place, format: :json)
end

json.array!(@thermostats) do |thermostat|
  json.extract! thermostat, :id, :serial_number, :location_id, :place
  json.url thermostat_url(thermostat, format: :json)
end

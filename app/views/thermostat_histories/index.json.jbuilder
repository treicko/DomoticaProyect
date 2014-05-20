json.array!(@thermostat_histories) do |thermostat_history|
  json.extract! thermostat_history, :id, :thermostat, :temperature, :humidity, :consumption
  json.url thermostat_history_url(thermostat_history, format: :json)
end

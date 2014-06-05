json.array!(@issues) do |issue|
<<<<<<< HEAD
  json.extract! issue, :id, :description, :state, :resolution, :thermostat_id
=======
  json.extract! issue, :id, :thermostat_id, :description, :status, :resolution
>>>>>>> 14ec02d6ab8edcf7325845df6814134b1178ee8a
  json.url issue_url(issue, format: :json)
end

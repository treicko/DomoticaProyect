class AddTemperatureToThermostat < ActiveRecord::Migration
  def change
  	add_column :thermostats, :temperature, :integer
  	add_column :thermostats, :configuration, :boolean
  end
end

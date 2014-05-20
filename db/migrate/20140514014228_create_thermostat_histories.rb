class CreateThermostatHistories < ActiveRecord::Migration
  def change
    create_table :thermostat_histories do |t|
      t.references :thermostat
      t.integer :temperature
      t.integer :humidity
      t.integer :consumption

      t.timestamps
    end
  end
end

class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.date :config_date
      t.time :config_time
      t.integer :temperature
      t.time :interval
      t.integer :thermostat_id

      t.timestamps
    end
  end
end

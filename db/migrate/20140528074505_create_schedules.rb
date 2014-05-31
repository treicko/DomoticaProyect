class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :day
      t.datetime :time
      t.integer :temperature
      t.integer :thermostat_id

      t.timestamps
    end
  end
end

class CreateThermostats < ActiveRecord::Migration
  def change
    create_table :thermostats do |t|
      t.integer :serial_number
      t.integer :location_id
      t.string :place

      t.timestamps
    end
  end
end

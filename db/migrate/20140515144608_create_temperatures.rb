class CreateTemperatures < ActiveRecord::Migration
  def change
    create_table :temperatures do |t|
      t.integer :basic_temp
      t.references :thermostats

      t.timestamps
    end
  end
end

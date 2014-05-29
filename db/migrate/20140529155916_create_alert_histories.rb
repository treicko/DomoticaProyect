class CreateAlertHistories < ActiveRecord::Migration
  def change
    create_table :alert_histories do |t|
      t.boolean :state, :default => 0, :null => false
      t.integer :thermostat_id
      t.integer :alert_id
      t.string :message

      t.timestamps
    end
  end
end

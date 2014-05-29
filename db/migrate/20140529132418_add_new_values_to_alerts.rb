class AddNewValuesToAlerts < ActiveRecord::Migration
  def change
    add_column :alerts, :config_time_initial, :time
    add_column :alerts, :config_time_final, :time
  end
end

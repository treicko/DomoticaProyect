class RemoveQuiandoConfigTimeFromAlerts < ActiveRecord::Migration
  def change
    remove_column :alerts, :config_time, :time
  end
end

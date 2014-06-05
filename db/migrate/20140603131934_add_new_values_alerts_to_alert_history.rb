class AddNewValuesAlertsToAlertHistory < ActiveRecord::Migration
  def change
    add_column :alert_histories, :active, :boolean, :default => 0, :null => false
  end
end

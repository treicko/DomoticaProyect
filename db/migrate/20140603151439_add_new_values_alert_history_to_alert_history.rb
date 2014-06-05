class AddNewValuesAlertHistoryToAlertHistory < ActiveRecord::Migration
  def change
    add_column :alert_histories, :user_id, :integer
  end
end

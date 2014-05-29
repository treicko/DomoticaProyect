class AddNewValuesToAlertHistory < ActiveRecord::Migration
  def change
    add_column :alert_histories, :user_email, :string
  end
end

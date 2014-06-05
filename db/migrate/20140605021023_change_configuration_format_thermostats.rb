class ChangeConfigurationFormatThermostats < ActiveRecord::Migration
  def change
  	 change_column :thermostats, :configuration, :string
  end
end

class AddNewValuesToAlert < ActiveRecord::Migration
  def change
    add_column :alerts, :interval, :string
  end
end

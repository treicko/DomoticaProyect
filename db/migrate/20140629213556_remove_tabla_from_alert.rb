class RemoveTablaFromAlert < ActiveRecord::Migration
  def change
    remove_column :alerts, :interval, :time
  end
end

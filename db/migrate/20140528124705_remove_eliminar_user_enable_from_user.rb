class RemoveEliminarUserEnableFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :user_enable, :boolean
  end
end

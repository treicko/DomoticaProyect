class AddNewValuesToUser < ActiveRecord::Migration
  def change
    add_column :users, :rol, :string, :default => "Usuario", :null => false
    add_column :users, :user_enable, :boolean, :default => 1, :null => false
  end
end

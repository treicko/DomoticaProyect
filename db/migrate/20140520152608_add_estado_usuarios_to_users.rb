class AddEstadoUsuariosToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_enable, :boolean2
  end
end

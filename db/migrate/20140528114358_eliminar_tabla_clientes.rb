class EliminarTablaClientes < ActiveRecord::Migration
  def down
    drop_table :clients
  end
end

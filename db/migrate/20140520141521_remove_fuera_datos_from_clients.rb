class RemoveFueraDatosFromClients < ActiveRecord::Migration
  def change
    remove_column :clients, :campo1, :string
    remove_column :clients, :campo2, :string
  end
end

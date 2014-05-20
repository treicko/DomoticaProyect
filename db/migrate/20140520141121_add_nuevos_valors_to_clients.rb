class AddNuevosValorsToClients < ActiveRecord::Migration
  def change
    add_column :clients, :campo1, :string
    add_column :clients, :campo2, :string
  end
end

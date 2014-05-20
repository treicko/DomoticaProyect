class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :lastName
      t.integer :id_user

      t.timestamps
    end
  end
end

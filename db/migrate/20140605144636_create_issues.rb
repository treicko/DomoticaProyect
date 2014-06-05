class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :description
      t.string :state, :default => "ABIERTO", :null => false
      t.string :resolution, :string, :default => "", :null => false
      t.integer :thermostat_id

      t.timestamps
    end
  end
end

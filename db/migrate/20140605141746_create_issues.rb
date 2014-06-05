class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.references :thermostat, index: true
      t.text :description
      t.string :status, default: "ABIERTO"
      t.string :resolution

      t.timestamps
    end
  end
end

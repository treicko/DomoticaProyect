class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.string :name
      t.references :temperatures

      t.timestamps
    end
  end
end

class CreateTriples < ActiveRecord::Migration
  def change
    create_table :triples do |t|
      t.time :start_time
      t.time :end_time
      t.references :days

      t.timestamps
    end
  end
end

class CreateObservations < ActiveRecord::Migration
  def change
    create_table :observations do |t|
    	t.string :text		
      t.timestamps
    end
  end
end

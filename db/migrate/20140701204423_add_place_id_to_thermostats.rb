class AddPlaceIdToThermostats < ActiveRecord::Migration
  def change
    add_column :thermostats, :place_id, :integer
  end
end

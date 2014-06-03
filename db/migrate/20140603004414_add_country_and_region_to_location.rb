class AddCountryAndRegionToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :country, :string
    add_column :locations, :region, :string
  end
end

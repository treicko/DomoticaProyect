class CambiandoValoresPorDefectoUsuarios < ActiveRecord::Migration
  def up
  	remove_column :users, :rol
  end
end

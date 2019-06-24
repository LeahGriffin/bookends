class AlterMediaAddLatAndLng < ActiveRecord::Migration[5.2]
  def change
    add_column :media, :latitude, :float
    add_column :media, :longitude, :float
  end
end

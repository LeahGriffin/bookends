class AlterMediaAddAddress < ActiveRecord::Migration[5.2]
  def change
    add_column :media, :address, :string
  end
end

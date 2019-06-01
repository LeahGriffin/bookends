class AddPublisherToMedia < ActiveRecord::Migration[5.2]
  def change
    add_column :media, :publisher, :string
  end
end

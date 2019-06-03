class AlterMediaAddUserId < ActiveRecord::Migration[5.2]
  def change
        add_column :media, :user_id, :integer
    add_index :media, :user_id
  end
end

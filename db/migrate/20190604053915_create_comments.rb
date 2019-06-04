class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :description
      t.string :rating
      t.integer :user_id
      t.integer :medium_id
      t.timestamps
    end

    add_index :comments, [:user_id, :medium_id]
    add_index :comments, :medium_id
  end
end

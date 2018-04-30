class CreateCollections < ActiveRecord::Migration[5.1]
  def change
    create_table :collections do |t|
      t.string :name
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :collections, [:user_id, :created_at]
  end
end

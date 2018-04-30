class CreateCardcollections < ActiveRecord::Migration[5.1]
  def change
    create_table :cardcollections do |t|
      t.integer :card_id
      t.integer :collection_id

      t.timestamps
    end
    add_index :cardcollections, [:card_id, :collection_id]
  end
end

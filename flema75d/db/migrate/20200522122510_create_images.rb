class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.text :image, null: false
      t.integer :item_id, foreign_key: true
      t.timestamps
    end
  end
end

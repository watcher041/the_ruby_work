class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :detail, null: false
      t.integer :price, null: false
      t.integer :pay_side, null: false
      t.integer :status, null: false
      t.integer :prefecture_id, null: false
      t.integer :brand_id
      t.integer :category_id, foreign_key: true
      t.integer :user_id, foreign_key: true
      t.integer :situation, null: false, default: 0
      t.string  :post_way
      t.integer :post_date
      t.integer :buyer_id
      t.timestamps
    end
  end
end

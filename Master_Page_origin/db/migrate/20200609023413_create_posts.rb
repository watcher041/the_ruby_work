class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title,       null: false
      t.text :text
      t.timestamps
      t.integer :user_id,    foreign_key: true
      t.integer :field_id,   foreign_key: true
    end
  end
end

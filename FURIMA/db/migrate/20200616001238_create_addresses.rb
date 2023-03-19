class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string  :zipcode,              null: false
      t.string  :address,              null: false
      t.string  :build_name         
      t.integer :user_id,              foreign_key: true
      t.timestamps
    end
  end
end

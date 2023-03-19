class AddAncestryToFields < ActiveRecord::Migration[6.0]
  def change
    add_column :fields, :ancestry, :string
    add_index :fields, :ancestry
  end
end

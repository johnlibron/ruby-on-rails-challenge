class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description
      t.decimal :price, precision: 8, scale: 2
      t.integer :user_id, null: false
      t.timestamps
    end
    
    add_foreign_key :products, :users
    add_index :products, :user_id
  end
end
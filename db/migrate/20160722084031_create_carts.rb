class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.string :email
      t.text :address
      t.string :notes
      t.decimal :price, precision: 10, scale: 2

      t.timestamps null: false
    end
  end
end

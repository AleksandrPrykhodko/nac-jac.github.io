class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :notes
      t.string :photo_url
      t.string :slug

      t.timestamps null: false
    end

    add_column :products, :price, :decimal, :precision => 8, :scale => 2
  end
end

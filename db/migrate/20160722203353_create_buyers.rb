class CreateBuyers < ActiveRecord::Migration
  def change
    create_table :buyers do |t|
      t.belongs_to :cart, index: true
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :address1
      t.string :address2
      t.string :state
      t.string :zip
      t.string :country

      t.timestamps null: false
    end
  end
end

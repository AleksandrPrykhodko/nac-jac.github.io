class AddTokenToCart < ActiveRecord::Migration
  def change
    add_column :carts, :token, :string
  end
end

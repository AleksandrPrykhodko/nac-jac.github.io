class CreateMailSubscriptions < ActiveRecord::Migration
  def change
    create_table :mail_subscriptions do |t|
      t.string :email, null: false
      t.timestamps
    end
    add_index :mail_subscriptions, [:email], :unique => true
  end
end

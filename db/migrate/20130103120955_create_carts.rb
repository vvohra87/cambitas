class CreateCarts < ActiveRecord::Migration
  def self.up
    create_table :carts do |t|
      t.references :customer       t.timestamps
    end

    add_index :carts, :customer_id
  end

  def self.down
    drop_table :carts
  end
end
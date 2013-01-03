class CreateWishlists < ActiveRecord::Migration
  def self.up
    create_table :wishlists do |t|
      t.references :customer       t.boolean :is_public       t.string :slug       t.timestamps
    end

    add_index :wishlists, :customer_id
  end

  def self.down
    drop_table :wishlists
  end
end
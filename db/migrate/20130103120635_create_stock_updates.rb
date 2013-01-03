class CreateStockUpdates < ActiveRecord::Migration
  def self.up
    create_table :stock_updates do |t|
      t.references :variant       t.integer :change       t.string :reason       t.timestamps
    end

    add_index :stock_updates, :variant_id
  end

  def self.down
    drop_table :stock_updates
  end
end
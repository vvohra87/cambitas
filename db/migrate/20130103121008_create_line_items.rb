class CreateLineItems < ActiveRecord::Migration
  def self.up
    create_table :line_items do |t|
      t.references :itemable , polymorphic: true      t.references :variant       t.integer :quantity       t.timestamps
    end

    add_index :line_items, :itemable_id
    add_index :line_items, :variant_id
  end

  def self.down
    drop_table :line_items
  end
end
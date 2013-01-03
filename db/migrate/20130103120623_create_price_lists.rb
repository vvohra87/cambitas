class CreatePriceLists < ActiveRecord::Migration
  def self.up
    create_table :price_lists do |t|
      t.references :variant       t.decimal :cost_price       t.decimal :flat_value_markup       t.decimal :percentage_markup       t.decimal :selling_price       t.decimal :tax       t.datetime :valid_from       t.timestamps
    end

    add_index :price_lists, :variant_id
  end

  def self.down
    drop_table :price_lists
  end
end
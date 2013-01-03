class CreateProductProperties < ActiveRecord::Migration
  def self.up
    create_table :product_properties do |t|
      t.string :value       t.references :product       t.references :property       t.timestamps
    end

    add_index :product_properties, :product_id
    add_index :product_properties, :property_id
  end

  def self.down
    drop_table :product_properties
  end
end
class CreateVariants < ActiveRecord::Migration
  def self.up
    create_table :variants do |t|
      t.string :sku       t.boolean :is_master       t.references :product       t.integer :current_stock       t.timestamps
    end

    add_index :variants, :product_id
  end

  def self.down
    drop_table :variants
  end
end
class CreateCODs < ActiveRecord::Migration
  def self.up
    create_table :cods do |t|
      t.boolean :enabled       t.decimal :min_order_value       t.decimal :max_order_value       t.references :pincode       t.timestamps
    end

    add_index :cods, :pincode_id
  end

  def self.down
    drop_table :cods
  end
end
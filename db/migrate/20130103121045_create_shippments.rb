class CreateShippments < ActiveRecord::Migration
  def self.up
    create_table :shippments do |t|
      t.references :order       t.string :unique_code       t.timestamps
    end

    add_index :shippments, :order_id
  end

  def self.down
    drop_table :shippments
  end
end
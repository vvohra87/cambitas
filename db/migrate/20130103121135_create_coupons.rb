class CreateCoupons < ActiveRecord::Migration
  def self.up
    create_table :coupons do |t|
      t.string :unique_code       t.string :name       t.decimal :minimum_order_value       t.decimal :flat_discount       t.decimal :percentage_discount       t.integer :number_of_uses       t.datetime :valid_from       t.datetime :valid_till       t.boolean :public       t.timestamps
    end

  end

  def self.down
    drop_table :coupons
  end
end
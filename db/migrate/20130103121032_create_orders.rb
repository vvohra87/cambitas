class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.string :unique_code       t.references :customer       t.references :coupon       t.boolean :gift_wrap       t.references :order_status       t.references :shipping_address       t.references :billing_address       t.boolean :made_offline       t.references :paymentable , polymorphic: true      t.timestamps
    end

    add_index :orders, :customer_id
    add_index :orders, :coupon_id
    add_index :orders, :order_status_id
    add_index :orders, :shipping_address_id
    add_index :orders, :billing_address_id
    add_index :orders, :paymentable_id
  end

  def self.down
    drop_table :orders
  end
end
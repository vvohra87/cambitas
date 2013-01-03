class CreateCustomerAddresses < ActiveRecord::Migration
  def self.up
    create_table :customer_addresses do |t|
      t.string :short_name       t.string :first_name       t.string :last_name       t.string :contact_number       t.string :line_one       t.string :line_two       t.references :pincode       t.references :city       t.references :state       t.references :country       t.timestamps
    end

    add_index :customer_addresses, :pincode_id
    add_index :customer_addresses, :city_id
    add_index :customer_addresses, :state_id
    add_index :customer_addresses, :country_id
  end

  def self.down
    drop_table :customer_addresses
  end
end
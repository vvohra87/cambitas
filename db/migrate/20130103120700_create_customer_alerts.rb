class CreateCustomerAlerts < ActiveRecord::Migration
  def self.up
    create_table :customer_alerts do |t|
      t.integer :type_cd       t.references :customer       t.timestamps
    end

    add_index :customer_alerts, :customer_id
  end

  def self.down
    drop_table :customer_alerts
  end
end
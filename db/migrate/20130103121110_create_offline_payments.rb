class CreateOfflinePayments < ActiveRecord::Migration
  def self.up
    create_table :offline_payments do |t|
      t.integer :method_cd       t.string :cheque_number       t.decimal :amount       t.text :notes       t.timestamps
    end

  end

  def self.down
    drop_table :offline_payments
  end
end
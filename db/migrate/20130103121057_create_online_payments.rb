class CreateOnlinePayments < ActiveRecord::Migration
  def self.up
    create_table :online_payments do |t|
      t.boolean :successful       t.decimal :amount       t.string :transaction_id       t.string :bank_transaction_id       t.text :notes       t.timestamps
    end

  end

  def self.down
    drop_table :online_payments
  end
end
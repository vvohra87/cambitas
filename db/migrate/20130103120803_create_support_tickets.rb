class CreateSupportTickets < ActiveRecord::Migration
  def self.up
    create_table :support_tickets do |t|
      t.string :unique_code       t.string :name       t.references :customer       t.integer :status_cd       t.timestamps
    end

    add_index :support_tickets, :customer_id
  end

  def self.down
    drop_table :support_tickets
  end
end
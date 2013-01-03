class CreatePageRequests < ActiveRecord::Migration
  def self.up
    create_table :page_requests do |t|
      t.string :path       t.string :session       t.references :customer       t.integer :page_duration       t.integer :db_duration       t.timestamps
    end

    add_index :page_requests, :customer_id
  end

  def self.down
    drop_table :page_requests
  end
end
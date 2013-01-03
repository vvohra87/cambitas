class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string :name       t.integer :gender_cd       t.string :mobile       t.date :birthday       t.boolean :is_offline       t.string :provider       t.string :uid       t.timestamps
    end

  end

  def self.down
    drop_table :customers
  end
end
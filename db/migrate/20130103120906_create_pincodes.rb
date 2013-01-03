class CreatePincodes < ActiveRecord::Migration
  def self.up
    create_table :pincodes do |t|
      t.string :name       t.references :city       t.timestamps
    end

    add_index :pincodes, :city_id
  end

  def self.down
    drop_table :pincodes
  end
end
class CreateCities < ActiveRecord::Migration
  def self.up
    create_table :cities do |t|
      t.string :name       t.references :country       t.timestamps
    end

    add_index :cities, :country_id
  end

  def self.down
    drop_table :cities
  end
end
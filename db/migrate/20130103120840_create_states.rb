class CreateStates < ActiveRecord::Migration
  def self.up
    create_table :states do |t|
      t.string :name       t.references :country       t.timestamps
    end

    add_index :states, :country_id
  end

  def self.down
    drop_table :states
  end
end
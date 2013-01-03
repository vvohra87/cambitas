class CreateOptionValues < ActiveRecord::Migration
  def self.up
    create_table :option_values do |t|
      t.string :name       t.string :display_name       t.references :option_type       t.timestamps
    end

    add_index :option_values, :option_type_id
  end

  def self.down
    drop_table :option_values
  end
end
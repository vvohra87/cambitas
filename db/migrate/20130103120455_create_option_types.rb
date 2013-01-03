class CreateOptionTypes < ActiveRecord::Migration
  def self.up
    create_table :option_types do |t|
      t.string :name       t.string :display_name       t.timestamps
    end

  end

  def self.down
    drop_table :option_types
  end
end
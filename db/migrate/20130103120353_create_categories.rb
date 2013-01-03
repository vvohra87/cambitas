class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name       t.integer :parent_id       t.integer :sort_order       t.boolean :enabled       t.string :slug       t.string :meta_title       t.string :meta_keywords       t.text :meta_description       t.text :description       t.timestamps
    end

  end

  def self.down
    drop_table :categories
  end
end
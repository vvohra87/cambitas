class CreateCategoryHierarchies < ActiveRecord::Migration
  def self.up
    create_table :category_hierarchies do |t|
      t.references :ancestor       t.references :descendant       t.integer :generations       t.timestamps
    end

    add_index :category_hierarchies, :ancestor_id
    add_index :category_hierarchies, :descendant_id
  end

  def self.down
    drop_table :category_hierarchies
  end
end
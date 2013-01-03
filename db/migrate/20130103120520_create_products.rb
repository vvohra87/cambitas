class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.references :brand       t.string :name       t.string :slug       t.string :meta_title       t.string :meta_keywords       t.text :meta_description       t.text :description       t.boolean :enabled       t.timestamps
    end

    add_index :products, :brand_id
  end

  def self.down
    drop_table :products
  end
end
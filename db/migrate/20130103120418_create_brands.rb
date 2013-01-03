class CreateBrands < ActiveRecord::Migration
  def self.up
    create_table :brands do |t|
      t.boolean :enabled       t.string :name       t.string :slug       t.string :meta_title       t.string :meta_keywords       t.text :meta_description       t.text :description       t.timestamps
    end

  end

  def self.down
    drop_table :brands
  end
end
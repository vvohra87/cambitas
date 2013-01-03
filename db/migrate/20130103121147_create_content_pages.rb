class CreateContentPages < ActiveRecord::Migration
  def self.up
    create_table :content_pages do |t|
      t.string :title       t.string :slug       t.string :meta_title       t.string :meta_keywords       t.text :meta_description       t.text :description       t.timestamps
    end

  end

  def self.down
    drop_table :content_pages
  end
end
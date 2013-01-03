class CreateProductImages < ActiveRecord::Migration
  def self.up
    create_table :product_images do |t|
      t.references :product       t.attachment :photo       t.integer :sort_order       t.timestamps
    end

    add_index :product_images, :product_id
  end

  def self.down
    drop_table :product_images
  end
end
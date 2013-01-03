class CreateProductReviews < ActiveRecord::Migration
  def self.up
    create_table :product_reviews do |t|
      t.references :customer       t.references :product       t.integer :rating       t.text :body       t.timestamps
    end

    add_index :product_reviews, :customer_id
    add_index :product_reviews, :product_id
  end

  def self.down
    drop_table :product_reviews
  end
end
class CreateProductVideos < ActiveRecord::Migration
  def self.up
    create_table :product_videos do |t|
      t.references :product       t.string :youtube_url       t.integer :sort_order       t.timestamps
    end

    add_index :product_videos, :product_id
  end

  def self.down
    drop_table :product_videos
  end
end
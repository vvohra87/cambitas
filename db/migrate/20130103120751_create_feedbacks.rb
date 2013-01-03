class CreateFeedbacks < ActiveRecord::Migration
  def self.up
    create_table :feedbacks do |t|
      t.string :name       t.string :email       t.string :number       t.text :message       t.string :from_page       t.timestamps
    end

  end

  def self.down
    drop_table :feedbacks
  end
end
class CreateSearchRequests < ActiveRecord::Migration
  def self.up
    create_table :search_requests do |t|
      t.string :term       t.string :first_page_products       t.integer :number_of_results       t.timestamps
    end

  end

  def self.down
    drop_table :search_requests
  end
end
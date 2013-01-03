class CreateSupportTicketResponses < ActiveRecord::Migration
  def self.up
    create_table :support_ticket_responses do |t|
      t.references :support_ticket       t.text :body       t.references :respondable , polymorphic: true      t.timestamps
    end

    add_index :support_ticket_responses, :support_ticket_id
    add_index :support_ticket_responses, :respondable_id
  end

  def self.down
    drop_table :support_ticket_responses
  end
end
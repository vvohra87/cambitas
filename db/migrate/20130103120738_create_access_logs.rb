class CreateAccessLogs < ActiveRecord::Migration
  def self.up
    create_table :access_logs do |t|
      t.references :loggable , polymorphic: true      t.string :sign_in_ip       t.timestamps
    end

    add_index :access_logs, :loggable_id
  end

  def self.down
    drop_table :access_logs
  end
end
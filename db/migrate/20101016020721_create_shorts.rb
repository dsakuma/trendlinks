class CreateShorts < ActiveRecord::Migration
  def self.up
    create_table :shorts do |t|
      t.string :url
      t.integer :resolved_id

      t.timestamps
    end
  end

  def self.down
    drop_table :shorts
  end
end

class CreateLastHours < ActiveRecord::Migration
  def self.up
    create_table :last_hours do |t|
      t.string :resolved_url
      t.integer :count

      t.timestamps
    end
  end

  def self.down
    drop_table :last_hours
  end
end

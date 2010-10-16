class CreateLastIds < ActiveRecord::Migration
  def self.up
    create_table :last_ids do |t|
      t.integer :last_id

      t.timestamps
    end
  end

  def self.down
    drop_table :last_ids
  end
end

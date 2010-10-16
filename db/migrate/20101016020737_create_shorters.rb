class CreateShorters < ActiveRecord::Migration
  def self.up
    create_table :shorters do |t|
      t.string :short_url
      t.integer :current_id
      t.integer :count

      t.timestamps
    end
  end

  def self.down
    drop_table :shorters
  end
end

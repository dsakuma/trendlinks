class CreateCurrents < ActiveRecord::Migration
  def self.up
    create_table :currents do |t|
      t.string :resolved_url

      t.timestamps
    end
  end

  def self.down
    drop_table :currents
  end
end

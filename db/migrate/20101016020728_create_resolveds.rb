class CreateResolveds < ActiveRecord::Migration
  def self.up
    create_table :resolveds do |t|
      t.string :resolved_url

      t.timestamps
    end
  end

  def self.down
    drop_table :resolveds
  end
end

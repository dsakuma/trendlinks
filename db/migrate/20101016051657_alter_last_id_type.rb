class AlterLastIdType < ActiveRecord::Migration
  def self.up
    execute "ALTER TABLE last_ids MODIFY last_id BIGINT"
  end

  def self.down
    execute "ALTER TABLE last_ids MODIFY last_id INT"
  end
end


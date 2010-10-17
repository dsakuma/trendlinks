class CreateViewTopSixHours < ActiveRecord::Migration
  def self.up
   execute "drop view IF EXISTS last_six_top"
    execute "create view last_six_top as
                  SELECT l.id as id, l.resolved_url as url, sum(l.count) as count
                  FROM last_hours l
                  GROUP BY l.resolved_url"
  end

  def self.down
	  execute "drop view IF EXISTS last_six_top"
  end
end

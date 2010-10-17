class Tops < ActiveRecord::Migration
  def self.up
    execute "drop view IF EXISTS tops"
    execute "create view tops as
                  SELECT c.id as id, c.resolved_url as url, sum(s.count) as count
                  FROM currents c inner join shorters s
                    on c.id = s.current_id
                  GROUP BY c.id"
  end

  def self.down
    execute "drop view IF EXISTS tops"
  end
end


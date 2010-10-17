class Current < ActiveRecord::Base
  belongs_to :shorters

	def self.find_top_10
		tops = self.find_by_sql(' SELECT c.id as id, c.resolved_url as url, sum(s.count) as count
			                  FROM currents c inner join shorters s
				         on c.id = s.current_id
			                  GROUP BY c.id
					ORDER BY sum(s.count) DESC
					 Limit 10')
	end
end

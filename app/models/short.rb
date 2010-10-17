class Short < ActiveRecord::Base
  has_many :resolveds

   def self.getLimitedUnprocessedList(lastIndex, limit)
       self.find_by_sql("select * from trendlinks.shorts where id > #{lastIndex} and resolved_id is null limit #{limit}")
   end

end
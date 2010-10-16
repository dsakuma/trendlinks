class Short < ActiveRecord::Base
  has_many 
  def self.getLimitedUnprocessedList(limit)
    self.find_by_sql("select * from trendlinks.shorts limit #{limit}")
  end

end

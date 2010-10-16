class Short < ActiveRecord::Base
  has_many :resolveds
  
  def self.getLimitedUnprocessedList(limit)
    self.find_by_sql("select * from trendlinks.shorts limit #{limit}")
  end

end

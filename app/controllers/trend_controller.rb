class TrendController < ApplicationController

def index
	@last_hour_tops = Top.find(:all, :order => 'count', :limit => 10)
end

end

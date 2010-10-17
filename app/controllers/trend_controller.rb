class TrendController < ApplicationController

def index
	@last_hour_tops = Top.find(:all,:conditions => 'url <> -1', :order => 'count DESC', :limit => 10)
	@last_6_hour_tops = LastSixTop.find(:all,:conditions => 'url <> -1', :order => 'count DESC', :limit => 10)
end

end


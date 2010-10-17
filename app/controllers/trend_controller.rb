class TrendController < ApplicationController

def index
	@last_hour_tops = Array.new
	@last_hour_tops.push('http://www.globo.com')
	@last_hour_tops.push('http://www.globo.com1')
	@last_hour_tops.push('http://www.globo.com2')
	@last_hour_tops.push('http://www.globo.com3')
	@last_hour_tops.push('http://www.globo.com3')
	@last_hour_tops.push('http://www.globo.com4')
	@last_hour_tops.push('http://www.globo.com5')
	@last_hour_tops.push('http://www.globo.com6')
	@last_hour_tops.push('http://www.globo.com7')
	@last_hour_tops.push('http://www.globo.com9')
end

end

require File.dirname(__FILE__)+ '/../script/resolverProcessor.rb'
require File.dirname(__FILE__)+ '/../app/jobs/thread_pool'

ENV["RAILS_ENV"] ||= "development"
ENV["PATH"] = "/usr/local/bin/:/opt/local/bin:#{ENV["PATH"]}"
require File.dirname(__FILE__)+'/../config/environment'
Rails.configuration.log_level = :info # Disable debug
ActiveRecord::Base.allow_concurrency = true


@log = Logger.new('/var/www/rr10-team-233/log/executor.log',1,10485760)

THREAD_POOL_SIZE = 20
SHORTS_LIMIT_DEFAULT = 20

def threadCreator(pool, last_index)
  begin

  shortList = Array.new
  shortList = Short.getLimitedUnprocessedList(last_index, SHORTS_LIMIT_DEFAULT)
  if(shortList[-1].id != nil)
    tmp = shortList[-1].id;
  else
    sleep(3)
  end

  pool.process{processShortList(shortList)};
  
  rescue Exception => e
    puts "Couldn't porcess ShortList...#{e.message}"
    sleep(3)  
    return last_index
  end
  return tmp;

end

begin
  @log.info("[#{Time.now}] Iniciando executor")
  pool = ThreadPool.new(THREAD_POOL_SIZE)
  last_index = 0;
  while(true)
    @log.info("[#{Time.now}] Criando thread")
    last_index = threadCreator(pool, last_index);
  end
end

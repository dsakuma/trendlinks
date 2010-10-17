require 'script/resolverProcessor.rb'
require 'app/jobs/thread_pool'


THREAD_POOL_SIZE = 20
SHORTS_LIMIT_DEFAULT = 20

def threadCreator(pool, last_index)
  begin
  shortList = Short.getLimitedUnprocessedList(last_index, SHORTS_LIMIT_DEFAULT)
  if(shortList[-1].id != nil)
    tmp = shortList[-1].id;
  else
    sleep(1)
  end

  pool.process{processShortList(shortList)};
  
  rescue Exception => e
    puts "Couldn't porcess ShortList...#{e.message}"
    return last_index
  end
  return tmp;
end

begin
  pool = ThreadPool.new(THREAD_POOL_SIZE)
  last_index = 0;
  while(true)
    last_index = threadCreator(pool, last_index);
  end
end
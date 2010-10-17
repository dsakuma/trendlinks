require 'rubygems'
require 'net/http'
require 'uri'

def processShortList(list)
  begin
    first_id = list[0].id
    last_id = list[-1].id
      
    list.each { |s|
      puts "Thread #{first_id} #{last_id} resolving short id: #{s.id} url: #{s.url}"
      s_url = s.url;

      resolved = getResolvedURL(s_url);
      if(resolved != nil)
        s.resolved_id = resolved.id
        s.save
      end
    }
  rescue  Exception => e
    puts "Thread #{first_id} #{last_id} #{e.message}"
  end  
end


#Resolve uma url encurtada e retorna um registro Resolved referente a essa url,
#um novo registro Resolved eh criado caso nao enenhum exista para aquela url.
def getResolvedURL(s_url)
  r_url = fetch(s_url);
  if(r_url != "-1")
    resolved = Resolved.find_by_resolved_url r_url;
    if(resolved == nil)
      resolved = Resolved.new
      resolved.resolved_url = r_url;
      resolved.save
    end
    resolved
  end
  nil
end

#dada uma url encurtada, retorna a url original
def fetch(uri_str, limit = 10)
  begin
    response = Net::HTTP.get_response(URI.parse(uri_str))
    case response
    when Net::HTTPMovedPermanently then response['location']
    else
      "-1"
    end
  rescue Exception
    "-1"
  end
end
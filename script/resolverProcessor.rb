#!/usr/bin/env ruby

require 'rubygems'
require 'net/http'
require 'uri'

ENV["RAILS_ENV"] ||= "development"
ENV["PATH"] = "/usr/local/bin/:/opt/local/bin:#{ENV["PATH"]}"
require File.dirname(__FILE__)+'/../config/environment'
Rails.configuration.log_level = :info # Disable debug
ActiveRecord::Base.allow_concurrency = true

DEFAULT_SHORTS_LIMIT = 1000;

#TODO - log

def processShortList()
  
  #logger.debug "processShortList..."

  list = getShortList(nil);
  list.each { |s|
    s_url = s.url;

    resolved = getResolvedURL(s_url);
    s.resolved_id = resolved.id
    s.save

    #logger.debug("ShortList processed.")
  }
end

def getShortList(limit)
  limit = DEFAULT_SHORTS_LIMIT if(limit == nil or limit == 0)
  #logger.debug("getting short list by limit "+limit.to_s)
  return Short.getLimitedUnprocessedList(limit)
end

def getResolvedURL(s_url)
  r_url = fetch(s_url);

  resolved = Resolved.find_by_resolved_url r_url;
  if(resolved == nil)
    resolved = Resolved.new
    resolved.resolved_url = r_url;
    resolved.save
  end

  resolved
end

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

processShortList()
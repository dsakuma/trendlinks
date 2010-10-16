#!/usr/bin/env ruby
#Este limpa as tabelas Short e Resolved
#Deve ser executado de hora em hora

require 'rubygems'
ENV["RAILS_ENV"] ||= "development"
ENV["PATH"] = "/usr/local/bin/:/opt/local/bin:#{ENV["PATH"]}"
require File.dirname(__FILE__)+'/../config/environment'
Rails.configuration.log_level = :info # Disable debug:q
ActiveRecord::Base.allow_concurrency = true

##################

def copy_to_current
  resolveds = Resolved.find(:all)
  for i in resolveds
    current = Current.new
    current.resolved_url = i.resolved_url
    current.save
    shorts = Short.find(:all, :conditions => 'resolved_id = #{i.id}')
    copy_to_shorter(shorts.length, current)
  end
end


def copy_to_shorter(length, current)
  s = Shorter.find_by_current_id(current.id)
   if (s.nil?)
     s = Shorter.new
     s.current_id = current.id
     s.short_url = current.resolved_url
     s.count = 1
   else
     s.count = s.count + length
   end
  s.save
end

def delete_resolved_and_short
  Short.delete_all
  Resolved.delete_all
end

begin
   copy_to_current
   delete_resolved_and_short
end


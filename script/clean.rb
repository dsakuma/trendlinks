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

def copy_to_current_shorter_last_hours
  resolveds = Resolved.find(:all)
  for i in resolveds
    current_array = Current.find(:all, :conditions => "resolved_url = '#{i.resolved_url}'")
    if current_array.empty?
      current = Current.new
      current.resolved_url = i.resolved_url
      current.save
   else
      current = current_array[0]
    end
    shorts = Short.find(:all, :conditions => "resolved_id = #{i.id}")
    copy_to_shorter(shorts.length, current)
    copy_to_lasthours current
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

def copy_to_lasthours current
   last_hours = LastHour.find_by_resolved_url(current.resolved_url)
   if last_hours.nil?
      last_hours = LastHour.new
      last_hours.resolved_url = current.resolved_url
      last_hours.count = 1
   else
      last_hours.count = last_hours.count + 1
   end
   last_hours.save
end



begin

  old_currents = Current.find :all, :select => "id"
  old_shortes = Shorter.find :first, :select => "id"

  puts"Copy to current shorter and last hours"
  copy_to_current_shorter_last_hours

  puts"Deletando current/shorter Antigas"
  Current.delete old_currents
  Shorter.delete old_shortes

  puts"Deletando Short/Resolved"
  Short.delete_all
  Resolved.delete_all
end


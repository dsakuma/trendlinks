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

@log = Logger.new('/var/www/rr10-team-233/log/clean_copy.log',1,10485760)


def copy_to_current_shorter_last_hours
  resolveds = Resolved.find(:all)
  for i in resolveds
    begin	
    current_array = Current.find(:all, :conditions => "resolved_url = '#{i.resolved_url}'")
    if current_array.empty?
      current = Current.new
      current.resolved_url = i.resolved_url
#      @log.info("[#{Time.now}] Salvando em current: [#{i.resolved_url}]")
      current.save
   else
 #     @log.info("[#{Time.now}] Lendo current existente: [#{i.resolved_url}]")
      current = current_array[0]
    end
    shorts = Short.find(:all, :conditions => "resolved_id = #{i.id}")
    copy_to_shorter(shorts.length, current)
    copy_to_lasthours current
   rescue Exception => e
      puts e.message
   end	
  end
end


def copy_to_shorter(length, current)
  s = Shorter.find_by_current_id(current.id)
   if (s.nil?)
   #  @log.info("[#{Time.now}] Adicionando um novo shorter para url: [#{current.resolved_url}]")
     s = Shorter.new
     s.current_id = current.id
     s.short_url = current.resolved_url
     s.count = 1
   else
     @log.info("[#{Time.now}] Adicionando shorter + 1 para url: [#{current.resolved_url}]")
     s.count = s.count + length
   end
  s.save
end

def copy_to_lasthours current
   last_hours = LastHour.find_by_resolved_url(current.resolved_url)
   if last_hours.nil?
  #   @log.info("[#{Time.now}] Adicionando um novo registro para lasthours da url: [#{current.resolved_url}]")
      last_hours = LastHour.new
      last_hours.resolved_url = current.resolved_url
      last_hours.count = 1
   else
     @log.info("[#{Time.now}] Adicionando count +1 para lasthours da url: [#{current.resolved_url}]")
      last_hours.count = last_hours.count + 1
   end
   last_hours.save
end



begin
  @log.info("[#{Time.now}] |||||||||||||||||||||||||||||||||||||")
@log.info("[#{Time.now}] Deletando current/shorter Antigas")
  Current.delete_all
 Shorter.delete_all

  @log.info("[#{Time.now}] Copiando para current shorter and last hours")
  copy_to_current_shorter_last_hours
  
  tops = Current.find_top_10

  Top.delete_all

  tops.each do |top|	
   	t = Top.new
  	t.url = top.url
	t.count = top.count
	t.save	
  end	

  @log.info("[#{Time.now}] Deletando short/resolved")
  Short.delete_all
  Resolved.delete_all
  @log.info("[#{Time.now}] Fim da execuação")
end


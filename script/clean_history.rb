#!/usr/bin/env ruby
#Este limpa as tabelas LastHours
#Deve ser executado de hora em hora

require 'rubygems'
ENV["RAILS_ENV"] ||= "development"
ENV["PATH"] = "/usr/local/bin/:/opt/local/bin:#{ENV["PATH"]}"
require File.dirname(__FILE__)+'/../config/environment'
Rails.configuration.log_level = :info # Disable debug:q
ActiveRecord::Base.allow_concurrency = true


require 'log4r'
include Log4r

@log = Logger.new('/var/www/rr10-team-233/log/clean_history.log',1,10485760)

horas = 6
horas_convertidas = horas * 3600
t = Time.now - horas_convertidas

begin
      @log.info("||||||||||||||||||||||||||||||")
      @log.info("[#{Time.now}] Apagando urls anteriores a [#{t}]")
      LastHour.delete_all(["created_at < ?", t])
      @log.info("[#{Time.now}] Fim da execucao")
rescue => e
      @log.error{"[#{Time.now}] >>>>> OCORREU UM PROBLEMA NA EXECUCAO DO SCRIPT"}
      @log.error{"[#{Time.now}] >>>>> Class: #{e.class.name}"}
      @log.error{"[#{Time.now}] >>>>> Message: #{e.message}"}
end


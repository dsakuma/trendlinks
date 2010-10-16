#!/usr/bin/env ruby
#Este script faz um search no twitter e popula a tabela SHORT de acordo

require 'rubygems'
require 'restfulie'
ENV["RAILS_ENV"] ||= "development"
ENV["PATH"] = "/usr/local/bin/:/opt/local/bin:#{ENV["PATH"]}"
require File.dirname(__FILE__)+'/../config/environment'
Rails.configuration.log_level = :info # Disable debug
ActiveRecord::Base.allow_concurrency = true


QUERY='+migre.me+OR+bit.ly'
RPP=100


def check_script
    if (`ps -ef | grep "search.rb" | grep -v grep | grep -v bash | wc -l`.to_i > 1)
      #jah estah em execucao
      puts "jah estah em execucao"
      return false
    else
      #o script pode ser executado
      return true
    end
end

def update_last_tweet_id(id)
  last_id = LastId.find :first
  if last_id.nil?
    last_id = LastId.new
    last_id.last_id = id
    last_id.save
  else
    last_id.update_attribute('last_id', id)
  end
end

#Retorna o Since Id
def since_id
  last_id = LastId.find :first
  if last_id.nil?
    return ""
  else
    return last_id.last_id
  end
end

#Faz o GET de acordo com os parâmetros passados no Twitter e retorna uma lista de resultados
#params Hash
def search_tweets(params)
  result=Restfulie.at("http://search.twitter.com/search.json").accepts("application/json").get(params)
  result
end

#Retorna os tweets
def get_tweets(query)
  puts "nakamashi log"
  tweets = Array.new
  result = search_tweets build_params nil
  puts "get_tweets antes do if"
  if !result.results.nil? && result.results.size > 0
    puts"Recebeu First ID: #{result.results.first.id}"
    update_last_tweet_id(result.results.first.id)
  end

  while !result.results.nil? do
    result.results.each do |r|
      tweets.push r.text
    end
    if !result.next_page.nil?
      result=search_tweets build_params(result.next_page[1..-1])
   else
     break
    end
  end
    puts "nakamashi log"
  tweets
end

#retorna um hash com os parâmetros da request
def build_params(next_page)
  hash_params = {}
  if(next_page.nil?)
    hash_params[:since_id]=since_id
  else
    params = next_page.split("&")
    params.each do |p|
      op = p.split("=")
      hash_params[op[0]]=op[1]
    end
  end
  hash_params[:q]=QUERY
  hash_params[:rpp]=RPP
  hash_params
end

#Recebe um array de msgs e retorna a url mencionada nela
def get_urls(tweets)
  urls = Array.new
  url_regexp = /^http:\/\/\w/
  for i in tweets
    url = i.split.grep(url_regexp)[0]
    if(!url.nil?)
      url = url.gsub(/.*http/, 'http')
      urls.push url
    end
  end
  urls
end

#Salva um array de urls na tabela Short
def save_urls(urls)
  for i in urls
   s = Short.new
   s.url = i
   s.save
  end
end

#### O script comeca aqui
begin
  while(true)
    #TODO: CRIAR LOG PARA CADA VEZ QUE O SCRIPT EH EXECUTADO
    puts "[#{Time.now}] Executando search.rb"
    if check_script
      tweets = get_tweets(QUERY)
      urls = get_urls(tweets)
      save_urls urls
   end
  end
end


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
def update_last_tweet_id(id)
#TODO guardar o ultimo id do twitter. banco???
end

#Retorna o Since Id
def since_id
  ""
end

#Faz o GET de acordo com os parâmetros passados no Twitter e retorna uma lista de resultados
#params Hash
def search_tweets(params)
  result=Restfulie.at("http://search.twitter.com/search.json").accepts("application/json").get(params)
  result
end

#Retorna os tweets
def get_tweets(query)
  tweets = Array.new
  result = search_tweets build_params nil
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
      return
    end
  end
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

def save_tweet result

end

#Recebe uma mensagem e retorna a url mencionada nela
def get_url(msg)

end
#### O script comeca aqui
begin
  tweets = get_tweets(QUERY)

end


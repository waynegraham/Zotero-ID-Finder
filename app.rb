require 'rubygems'
require 'sinatra'

configure :production do
  
end

get '/' do
  
end

get '/env' do
  ENV.inspect
end
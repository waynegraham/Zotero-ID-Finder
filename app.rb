require 'rubygems'
require 'sinatra'

configure do
  set :views, "#{File.dirname(__FILE__)}/views"
end

error do
  e = request.env['sinatra.error']
  Kernel.puts e.backtrace.join("\n")
  'Application error'
end

get '/' do
  haml :root
end

# get '/env' do
#   ENV.inspect
# end
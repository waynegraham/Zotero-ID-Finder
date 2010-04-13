require 'rubygems'
require 'sinatra'
require 'environment'
require 'nokogiri'
require 'open-uri'

configure do
  set :views, "#{File.dirname(__FILE__)}/views"
end

error do
  e = request.env['sinatra.error']
  Kernel.puts e.backtrace.join("\n")
  'Application error'
end

helpers do
  # add your helpers here
end

# root page
get '/' do
  haml :root
end

post '/' do
  doc = Nokogiri.parse(open("http://www.zotero.org/api/users/#{params[:username]}")).xpath("//id")
  @id = doc.to_s[/[0-9]+/]
  haml :result
end

get '/:username' do
    doc = Nokogiri.parse(open("http://www.zotero.org/api/users/#{params[:username]}")).xpath("//id")
    @id = doc.to_s[/[0-9]+/]
    haml :result
end
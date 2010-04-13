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
  include Rack::Utils
  alias_method :h, :escape_html
end

# root page
get '/' do
  haml :root
end

post '/' do
  begin
    doc = Nokogiri.parse(open("http://www.zotero.org/api/users/#{params[:username]}")).xpath("//id")
    @id = doc.to_s[/[0-9]+/]
  rescue
    @id = "Not found"
  end
  haml :result
end

get '/:username' do
  begin
    doc = Nokogiri.parse(open("http://www.zotero.org/api/users/#{params[:username]}")).xpath("//id")
    @id = doc.to_s[/[0-9]+/]
  rescue
    @id = "Not found"
  end
    haml :result
end
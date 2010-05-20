require 'rubygems'
require 'sinatra'
require 'environment'
require 'nokogiri'
require 'open-uri'
require 'json'

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
  @id = get_user(params[:username])
  haml :result
end

get '/:username' do  
  content_type "application/json"
  {:username => params[:username], :id => get_user(params[:username])}.to_json
end

# convenience method to get user 
def get_user(username)
  begin
    doc = Nokogiri.parse(open("http://www.zotero.org/api/users/#{params[:username]}")).xpath("//id")
    return doc.to_s[/[0-9]+/]
  rescue
    return 'Not Found'
  end
end
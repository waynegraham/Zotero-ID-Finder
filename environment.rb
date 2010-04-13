require 'rubygems'
require 'haml'
require 'ostruct'

require 'sinatra' unless defined?(Sinatra)

configure do
  SiteConfig = OpenStruct.new(
                 :title => 'Zotero ID Finder',
                 :author => 'Scholars\' Lab ',
                 :author_url => 'http://www.scholarslab.org',
                 :url_base => 'http://localhost:4567/'
               )
               
  # load models
  $LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")
  Dir.glob("#{File.dirname(__FILE__)}/lib/*.rb") { |lib| require File.basename(lib, '.*') }
end
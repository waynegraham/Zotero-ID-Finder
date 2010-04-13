require 'rubygems'
require 'sinatra'
require 'spec'
require 'spec/interop/test'
require 'rack/test'
require 'haml'

# set test environment
Sinatra::Base.set :environment, :test
Sinatra::Base.set :run, false
Sinatra::Base.set :raise_errors, true
Sinatra::Base.set :logging, false

require 'app'

# establish in-memory database for testing
#DataMapper.setup(:default, "sqlite3::memory:")

Spec::Runner.configure do |config|
  # reset database before each example is run
  #config.before(:each) { DataMapper.auto_migrate! }
end

# Renders the supplied template with Haml::Engine and assigns
# @response instance variable
def render(template)
  template = File.read("./views/#{template}")
  engine = Haml::Engine.new(template)
  @response = engine.render
end
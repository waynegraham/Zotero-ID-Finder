require "#{File.dirname(__FILE__)}/spec_helper"


describe 'main application' do
  include Rack::Test::Methods

  def app
    Sinatra::Application.new
  end

  specify 'should show the default index page' do
    get '/'
    last_response.should be_ok
  end

  it "should return the correct content-type when viewing root" do
    get '/'
    last_response.headers['Content-Type'].should == "text/html"
  end
  
  it "should return a page when a user search is made" do
    get '/test'
    last_response.status.should == 200
  end
  
  it "should return a page when a user search is done" do
    post '/test'
    #last_response.status.should == 200
  end
end

describe 'haml' do
  
  it "should display the user id on the page" do
    params[:username] = 1
    @id = 1
    render("result.haml")
    response.should have_selector ('p', :content => @id)
  end
end


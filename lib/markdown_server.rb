require 'bundler'
require 'sinatra'
require 'rdiscount'
Bundler.setup

class MarkdownServer < Sinatra::Application
  
  #do configurations and stuff
  configure do
    set :views, File.expand_path('../../views', __FILE__)
  end
  
  get '/' do
    redirect to('/index')
  end
  
end

Dir[File.expand_path(File.dirname(__FILE__) + "/markdown_server/**/*.rb")].each do |file|
  require file
end
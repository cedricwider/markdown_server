# frozen_string_literal: true

require 'bundler'
require 'sinatra'
require 'rdiscount'
Bundler.setup

# Markdown Server serves .md files from its view/content directory
# and has also capabilities to create new and edit existing files.
class MarkdownServer < Sinatra::Application
  # do configurations and stuff
  configure do
    set :views, File.expand_path('../../views', __FILE__)
  end

  get '/' do
    redirect to('/index')
  end
end

def all_rb_files
  Dir[File.expand_path(File.dirname(__FILE__) + '/markdown_server/**/*.rb')]
end

all_rb_files.each do |file|
  require file
end

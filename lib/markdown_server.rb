require "rubygems"
require "bundler"
Bundler.setup

class MarkdownServer
end

Dir[File.expand_path(File.dirname(__FILE__) + "/markdown_server/*.rb")].each do |file|
  require file
end
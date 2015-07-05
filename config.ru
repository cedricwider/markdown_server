#\ -o 0.0.0.0 -p 8888

root = ::File.dirname(__FILE__)
require ::File.join(root, '/lib/markdown_server' )
run MarkdownServer.new
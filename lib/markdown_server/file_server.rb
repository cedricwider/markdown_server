# frozen_string_literal: true

require 'haml'
require 'rdiscount'
require 'json'
require_relative 'helper/helper'

# Markdown server.
class MarkdownServer < Sinatra::Application
  include Helper

  get '/new' do
    haml :new
  end

  get '/:filename' do
    redirect to('/new') unless exist?(name: filename)

    haml :read, locals:
      {
        text: html_content_from(markup: filename),
        title: title,
        files: available_files
      }
  end

  get '/edit/:filename' do
    haml :edit, locals:
      {
        text: markup_content_from(file: filename),
        title: title
      }
  end

  post '/edit/:filename' do
    body_text = Rack::Utils.unescape(request[:text])
    write_markup!(file: filename, content: body_text)
    redirect to("/#{filename}")
  end

  post '/create' do
    body_text = Rack::Utils.unescape(request[:text])
    title = Rack::Utils.unescape(request[:title])
    write_markup!(file: title, content: body_text)
    redirect to("/#{title}")
  end

  def title
    "#{filename} - Markdown Wiki"
  end

  def filename
    params[:filename]
  end
end

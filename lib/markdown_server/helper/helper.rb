# frozen_string_literal: true

# Helper module.
module Helper
  MARKUP_VIEWS_DIR = 'views/content'

  def html_content_from(markup: nil)
    md = RDiscount.new(file_content_for(markup))
    md.to_html
  end

  def file_content_for(markup)
    File.read(File.expand_path("#{MARKUP_VIEWS_DIR}/#{markup}.md"))
  end

  def markup_content_from(file: nil)
    file_content_for(file)
  end

  def write_markup!(file: nil, content: nil)
    File.write(File.expand_path("#{MARKUP_VIEWS_DIR}/#{file}.md"), content)
  end

  def available_files
    files = Dir["#{MARKUP_VIEWS_DIR}/*.md"]
    files.map { |file| File.basename(file).gsub('.md', '') }.sort
  end

  def exist?(name: nil)
    File.exist?("#{MARKUP_VIEWS_DIR}/#{name}.md")
  end
end

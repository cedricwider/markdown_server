module Helper
  MARKUP_VIEWS_DIR = 'views/content'
  
  def html_content_from(markup:)
    md = RDiscount.new(File.read(File.expand_path("#{MARKUP_VIEWS_DIR}/#{markup}.md")))
    md.to_html
  end
  
  def markup_content_from(file:)
    File.read(File.expand_path("#{MARKUP_VIEWS_DIR}/#{file}.md"))
  end
  
  def write_markup!(file:, content:)
    File.write(File.expand_path("#{MARKUP_VIEWS_DIR}/#{file}.md"), content)
  end
  
  def available_files
    files = Dir["#{MARKUP_VIEWS_DIR}/*.md"]
    files.map { | file | File.basename(file).gsub('.md', '') }.sort
  end
  
  def exist?(name:)
    File.exist?("#{MARKUP_VIEWS_DIR}/#{name}.md")
  end
end
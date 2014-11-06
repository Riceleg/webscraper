require 'rubygems'
require 'nokogiri'
require 'restclient'
require 'open-uri'
require 'pry'


class WebScraper

  def self.open_url(url)  # class method why is this a class method
    # url = open("http://...", :http_basic_authentication=>[user, password])
    # url = open(url, :http_basic_authentication=>[user, password])
    @@page = Nokogiri::HTML(open(url))
    #p @@page.class

  end

  def self.extract_titles
    titles = @@page.search('.title > a:first-child').map do |element|
      element.inner_text
    end
    p titles
  end

  def self.extract_url
    url = @@page.search('.title > .comhead').map do |element|
      element.inner_text
    end
    p url
  end

  def self.extract_points
    points = @@page.search('.subtext > span:first-child').map do |element|
      element.inner_text
    end
    p points
  end

  def self.item_id
    item_id = @@page.search('.subtext > span:first-child').map do |element|
      element.attributes['id'].value
    end
    p item_id
  end


end


WebScraper.open_url(ARGV[0])

WebScraper.extract_titles
WebScraper.extract_url
WebScraper.extract_points
WebScraper.item_id

# Post title: XXXXXX
# Number of comments: XXXXX
# ... some other statistics we might be interested in -- your choice ...

# html_file = open('http://www.ruby-doc.org/stdlib-2.0.9/libdoc/open-uri/rdoc/OpenURI.html')
# puts html_file.read


# Instantiates a Post object
# Parses the Hacker News HTML
# Creates a new Comment object for each comment in the HTML, adding it to the Post object in (1)

require 'rubygems'
require 'nokogiri'
require 'open-uri'

class Post

  attr_accessor :title, :url, :points, :item_id

  def initialize(title, url, points, item_id)
    @title = title
    @url = url
    @points = points
    @item_id = item_id
    # @doc = Nokogiri::HTML(File.open('post.html'))
  end


  def

    def comments

    end

    def adds_comment

    end

  end

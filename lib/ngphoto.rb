# -*- encoding : utf-8 -*-
require 'open-uri'
require 'nokogiri'

class Ngphoto
  NG_PHOTO_OF_THE_DAY_URL = "http://photography.nationalgeographic.com/photography/photo-of-the-day/"

  attr_reader :title, :url

  def initialize(title, url)
    @title = Time.now.strftime('%Y-%m-%d-') + title.split('--')[0].strip.gsub(' ', '-').downcase
    @url   = url
  end

  def save
    system "curl -o ~/Pictures/ngphoto/#{title}.jpg #{url}"
  end

  def self.fetch
    doc = Nokogiri::HTML(open(NG_PHOTO_OF_THE_DAY_URL))
    
    title = doc.css('title').first.text
    url   = doc.css('.download_link a').first[:href]

    Ngphoto.new title, url
  end
end

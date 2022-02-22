require 'nokogiri'
require 'byebug'
require 'open-uri'

def scraper
  url = "https://www.skysports.com/football"
  unparsed_page = URI.open(url)
  parsed_page = Nokogiri::HTML(unparsed_page)
  articles = parsed_page.css('h4.news-list__headline')
  articles.each do |post|
    article = {
      title: post.css('a.news-list__headline-link').text.gsub(/^\s*|\s*$/, "")
    }
    puts article[:title]
  end
  
end

scraper

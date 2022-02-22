require 'nokogiri'
require 'byebug'
require 'open-uri'

def scraper
  url = "https://www.skysports.com/football"
  posts = []
 
  articles = Nokogiri::HTML(URI.open(url)).css('h4.news-list__headline')
  articles.each do |article|
    post = {
      title: article.css('a.news-list__headline-link').text.gsub(/^\s*|\s*$/, ""),
      url: articles.css('a')[0].attributes['href'].value
    }
    posts << post
  end
  byebug
end

scraper

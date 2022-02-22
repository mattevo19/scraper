require 'nokogiri'
require 'byebug'
require 'open-uri'

def scraper
  url = "https://www.skysports.com/football"
  unparsed_page = URI.open(url)
  parsed_page = Nokogiri::HTML(unparsed_page)
  articles = parsed_page.css('h4.news-list__headline')
  posts = []
  articles.each do |article|
    post = {
      title: article.css('a.news-list__headline-link').text.gsub(/^\s*|\s*$/, "")
    }
    posts << post
  end
  byebug
end

scraper

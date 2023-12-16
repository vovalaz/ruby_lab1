require_relative 'item'
require 'bundler/setup'
require 'nokogiri'
require 'open-uri'

class Parser
  def self.parse_item(url)
    html = URI.open(url)
    doc = Nokogiri::HTML(html)
    ebook_no = doc.at('th:contains("EBook-No.") + td').text.strip
    author = doc.at('th:contains("Author") + td a').text.strip
    title = doc.at('th:contains("Title") + td').text.strip
    language = doc.at('th:contains("Language") + td').text.strip
    release_date = doc.at('th:contains("Release Date") + td').text.strip

    subjects = doc.css('th:contains("Subject") + td a').map { |a| a.text.gsub("\n", '') }

    book = Book.new(ebook_no, author, title, subjects, language, release_date)

    return book
  end
end


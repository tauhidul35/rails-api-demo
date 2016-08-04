class WebPage < ApplicationRecord
  require 'nokogiri'
  require 'open-uri'

  validates :url, presence: true

  before_save :parse_content

  private

  def parse_content
    page = Nokogiri::HTML(open(url))
    content = []

    page.css('h1', 'h2', 'h3', 'a').each do |link|
      content << { tag: link.name, text: link.content.strip }
    end

    self.content = content

  rescue SocketError => e
    errors.add(:url, e.message)
    raise
  end
end

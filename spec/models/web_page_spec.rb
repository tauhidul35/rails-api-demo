require 'rails_helper'

RSpec.describe WebPage, type: :model do
  it 'is valid with valid attributes' do
    expect(WebPage.new(url: 'http://example.com')).to be_valid
  end

  it 'is not valid without a url' do
    web_page = WebPage.new(url: nil)
    expect(web_page).to_not be_valid
  end
end

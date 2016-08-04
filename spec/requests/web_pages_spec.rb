require 'rails_helper'

RSpec.describe 'WebPages', type: :request do
  describe 'GET /web_pages' do
    it 'works! (now write some real specs)' do
      get web_pages_path
      expect(response).to have_http_status(200)
    end
  end
end

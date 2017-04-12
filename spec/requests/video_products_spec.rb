require 'rails_helper'

RSpec.describe 'Video products endpoints for the API', type: :request do
  let!(:video_products) { FactoryGirl.create_list(:video_product, 10)  }

  describe 'GET /api/video_products' do
    before { get api_video_products_path }

    it 'returns all the video products(movies and seasons)' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it "returns video products ordered by creation" do
      expect(json).to eq(sort_by_creation(json))
    end

  end
end

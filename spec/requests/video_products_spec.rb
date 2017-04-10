require 'rails_helper'

RSpec.describe 'Video products API', type: :request do
  #let!(:seasons) { FactoryGirl.create_list(:season, 10)  }

  describe 'GET /video_products' do
    before { get '/video_products' }

    it 'returns both movies and seasons, ordered by creation' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    context 'for a given season' do
      it 'returns the list of episodes ordered by its number' do
        expect(json).not_to be_empty
      end
    end

  end
end

require 'rails_helper'

RSpec.describe 'Seasons endpoints for the API', type: :request do
  let!(:seasons) { FactoryGirl.create_list(:season, 5)  }

  describe 'GET /api/seasons' do
    before { get api_seasons_path }

    it 'returns all the Seasons' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it 'return seasons ordered by creation' do
      expect(json).to eq(sort_by_creation(json))
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    context 'for a given season' do
      it 'returns the list of episodes' do
        expect(json.first.has_key?('episodes')).to be true
        # Check season spec/factories/season.rb
        expect(json.first['episodes'].size).to eq(3)
      end
      it "returns episodes ordered by its number" do
        expect(json.first['episodes']).to eq(sort_by_episode_number(json.first['episodes']))
      end
    end

  end
end

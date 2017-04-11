require 'rails_helper'

RSpec.describe 'Movies endpoints for the API', type: :request do
  let!(:movies) { FactoryGirl.create_list(:movie, 5)  }

  describe 'GET /movies' do

    before { get '/movies' }

    it 'returns all the the movies' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it 'return movies ordered by creation' do
      expect(json).to eq(sort_by_creation(json))
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end


end

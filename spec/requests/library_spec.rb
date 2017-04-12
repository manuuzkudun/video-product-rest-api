require 'rails_helper'

RSpec.describe 'User library API endpoints', type: :request do
  let!(:user) { FactoryGirl.create(:user)  }
  let!(:purchases) { FactoryGirl.create_list :purchase, 5, user: user  }
  describe 'GET /api/library' do

    context 'when all video product are active' do
      before { get api_user_library_index_path(user) }
      it 'returns all the user´s video products' do
        expect(json).not_to be_empty
        expect(json.size).to eq(5)
      end
      it 'returns movies ordered by the time left to watch the content' do
        expect(json).to eq(sort_by_time_left(json))
      end
    end

    context 'when one video product is expired' do
      before do
        expired_purchase = purchases.first
        expired_purchase.update(expiration: 2.days.ago)
        get api_user_library_index_path(user)
      end
      it 'doesn´t return expired movies' do
        expect(json.size).to eq(4)
      end
    end
  end
end

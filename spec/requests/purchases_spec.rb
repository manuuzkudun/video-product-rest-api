require 'rails_helper'

RSpec.describe 'Purchases endpoints for the API', type: :request do
  let!(:user) { FactoryGirl.create(:user)  }
  let!(:purchase_option) { FactoryGirl.create(:purchase_option)  }

  describe 'POST /purchases' do
    context 'a given user can purchase a video product' do
      let!(:video_product) { FactoryGirl.create(:video_product)  }
      let!(:purchase) { post purchases_path, params: {
                          purchase_option_id: purchase_option.id,
                          video_product_id: video_product.id,
                          user_id: user.id
                        }
                      }
      it 'responds successfully with an HTTP 201 status code' do
        expect(response).to be_success
        expect(response).to have_http_status(201)
      end
      it 'responds successfully the purchase data' do
        expect(json["id"]).not_to be_nil
      end
    end
  end
end

require 'rails_helper'

RSpec.describe 'Purchases endpoints for the API', type: :request do
  let!(:user) { FactoryGirl.create(:user)  }
  let!(:purchase_option) { FactoryGirl.create(:purchase_option)  }
  let!(:video_product) { FactoryGirl.create(:video_product)  }

  describe 'POST /purchases' do

    context 'when a user purchase a video product' do
      let!(:purchase) { post api_purchases_path, params: {
                          purchase_option_id: purchase_option.id,
                          video_product_id: video_product.id,
                          user_id: user.id
                        }
                      }
      it 'responds successfully with an HTTP 201 status code' do
        expect(response).to be_success
        expect(response).to have_http_status(201)
      end
      it 'responds successfully with the purchase data' do
        expect(json["id"]).not_to be_nil
      end
    end

    context 'when a user tries to buy a video product that is active in his/her library' do
      let!(:purchase) { FactoryGirl.create(:purchase, user: user, video_product: video_product) }
      let!(:new_purchase) { post api_purchases_path, params: {
                          purchase_option_id: purchase_option.id,
                          video_product_id: video_product.id,
                          user_id: user.id
                        }
                      }
      it 'responds with an HTTP 409 status error' do
        expect(response).to have_http_status(409)
      end
    end

    context 'when a user tries to buy a video product that is expired in his/her library' do
    let!(:purchase) { FactoryGirl.create(:purchase, user: user, video_product: video_product) }
      before do
        purchase.update(expiration: 2.days.ago)
        post api_purchases_path, params: {
              purchase_option_id: purchase_option.id,
              video_product_id: video_product.id,
              user_id: user.id
            }
      end
      it 'responds successfully with an HTTP 201 status code' do
        expect(response).to be_success
        expect(response).to have_http_status(201)
      end
      it 'responds successfully with the purchase data' do
        expect(json["id"]).not_to be_nil
      end
    end

  end
end

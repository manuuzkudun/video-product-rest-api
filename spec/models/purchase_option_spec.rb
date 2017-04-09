require 'rails_helper'

RSpec.describe PurchaseOption, type: :model do
  subject(:purchase_option) { FactoryGirl.build(:purchase_option) }

  it "is valid with valid attributes" do
    expect(purchase_option).to be_valid
  end
  it "is not valid without a price" do
    purchase_option.price_cents = nil
    expect(purchase_option).to_not be_valid
  end
  it "is not valid without a price currency" do
    purchase_option.price_currency = nil
    expect(purchase_option).to_not be_valid
  end
  it "is not valid without a video quality" do
    purchase_option.video_quality = nil
    expect(purchase_option).to_not be_valid
  end
  it "is not valid if video quality is different of 'HD' or 'SD'" do
    purchase_option.video_quality = 'MD'
    expect(purchase_option).to_not be_valid
  end
  it "is not valid for a currency different than 'EUR'" do
    purchase_option.price_currency = 'USD'
    expect(purchase_option).to_not be_valid
  end
end

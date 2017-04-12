require 'rails_helper'

RSpec.describe Purchase, type: :model do
  subject(:purchase) { FactoryGirl.create(:purchase) }

  it "is valid with valid attributes" do
    expect(purchase).to be_valid
  end
  it "is not valid without a user" do
    purchase.user = nil
    expect(purchase).to_not be_valid
  end
  it "is not valid without a video product" do
    purchase.video_product = nil
    expect(purchase).to_not be_valid
  end
  it "is not valid without a purchase option" do
    purchase.purchase_option = nil
    expect(purchase).to_not be_valid
  end

end

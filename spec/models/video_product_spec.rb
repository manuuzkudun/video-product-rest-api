require 'rails_helper'

RSpec.describe VideoProduct, type: :model do
  subject(:video_product) { FactoryGirl.create(:video_product) }
  it "is valid with valid attributes" do
    expect(video_product).to be_valid
  end
  it "is not valid without a title" do
    video_product.title = nil
    expect(video_product).to_not be_valid
  end
  it "is not valid without a plot" do
    video_product.plot = nil
    expect(video_product).to_not be_valid
  end
  it "is not valid without a type" do
    video_product.type = nil
    expect(video_product).to_not be_valid
  end
  it "is not valid if type is different to 'Movie' or 'Season'" do
    video_product.type = "Videoclip"
    expect(video_product).to_not be_valid
  end
end

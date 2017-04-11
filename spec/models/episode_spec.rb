require 'rails_helper'

RSpec.describe Episode, type: :model do
  subject(:episode) { FactoryGirl.build(:episode) }

  it "is valid with valid attributes" do
    expect(episode).to be_valid
  end
  it "is not valid without a title" do
    episode.title = nil
    expect(episode).to_not be_valid
  end
  it "is not valid without a plot" do
    episode.plot = nil
    expect(episode).to_not be_valid
  end
  it "is not valid without a episode_in_season" do
    episode.episode_in_season = nil
    expect(episode).to_not be_valid
  end

  it "is not valid without a season" do
    episode.season = nil
    expect(episode).to_not be_valid
  end

  describe "Associations" do
    it "belongs to a season" do
      assc = described_class.reflect_on_association(:season)
      expect(assc.macro).to eq :belongs_to
    end
  end

end

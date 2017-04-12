require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { FactoryGirl.create(:user) }

  it "is valid with valid attributes" do
    expect(user).to be_valid
  end
  it "is not valid without email" do
    user.email = nil
    expect(user).to_not be_valid
  end
end

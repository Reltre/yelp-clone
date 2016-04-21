require 'rails_helper'

describe Business do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:reviews) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:time_open) }
  it { is_expected.to validate_presence_of(:time_close) }

  describe '#rating' do
    let!(:business) { Fabricate(:business) }

    it "returns zero if no reviews present" do
      expect(business.rating).to eq(0)
    end

    it "returns the average of all user reviews" do
      Fabricate(:review, business: business, rating: 2)
      Fabricate(:review, business: business, rating: 4)
      expect(business.rating).to eq(3)
    end
  end
end

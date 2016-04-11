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

    it "should return zero if no reviews present" do
      expect(business.rating).to eq(0)
    end

    it "should return the average of all user reviews" do
      review1 = Fabricate(:review, rating: 2)
      review2 = Fabricate(:review, rating: 4)
      review3 = Fabricate(:review, rating: 3)
      business.reviews << review1 << review2 << review3
      average = (review1.rating + review2.rating + review3.rating) / 3
      expect(business.rating).to eq(average)
    end
  end
end

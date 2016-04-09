require 'rails_helper'

describe Business do
  it { should belong_to(:user) }
  it { should have_many(:reviews) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:time_open) }
  it { should validate_presence_of(:time_close) }

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

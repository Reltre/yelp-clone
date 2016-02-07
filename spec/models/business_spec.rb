require 'rails_helper'

describe Business do
  it { should belong_to(:user) }
  it { should have_many(:reviews) }

  describe '#rating' do
    it "should return zero if no reviews present" do
      business = Fabricate(:business)
      expect(business.rating).to eq(0)
    end

    it "should return the average of all user reviews" do
      business = Fabricate(:business)
      review1 = Fabricate(:review, rating: 2)
      review2 = Fabricate(:review, rating: 4)
      review3 = Fabricate(:review, rating: 3)
      business.reviews << review1 << review2 << review3
      average = (review1.rating + review2.rating + review3.rating) / 3
      expect(business.rating).to eq(average)
    end
  end
end

require 'rails_helper'

describe PagesController do
  describe "GET home" do
    it "sets @reviews in descending order" do
      review1 = Fabricate(:review)
      review2 = Fabricate(:review)
      get :home
      expect(assigns(:reviews)).to eq([review2, review1])
    end

    it "sets no more than 5 reviews" do
      6.times { Fabricate(:review) }
      get :home
      expect(assigns(:reviews).count).to be < 6
    end

    it "sets @businesses in descending order" do
      business1 = Fabricate(:business)
      business2 = Fabricate(:business)
      get :home
      expect(assigns(:businesses)).to eq([business2, business1])
    end

    it "sets no more than 5 businesses" do
      6.times { Fabricate(:business) }
      get :home
      expect(assigns(:businesses).count).to be < 6
    end
  end
end

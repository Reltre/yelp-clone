require 'rails_helper'

describe PagesController do
  describe "GET home" do

    it "sets @reviews" do
      review1 = Fabricate(:review)
      review2 = Fabricate(:review)
      get :home
      expect(assigns(:reviews)).to match_array([review1, review2])
    end

    it "sets @businesses" do
      business1 = Fabricate(:business)
      business2 = Fabricate(:business)
      get :home
      expect(assigns(:businesses)).to match_array([business1, business2]) 
    end
  end
end

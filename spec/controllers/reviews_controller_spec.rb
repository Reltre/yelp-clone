require 'rails_helper'

describe ReviewsController do

  let(:business_id) { Fabricate(:business).id }

  describe "GET new" do
    before { get :new, business_id: business_id }

    it { expect(assigns(:review)).to be_a_new(Review) }
  end

  describe "POST create" do
    #expects data of the type review { "rating" => "some number", "content" => "string"}
    context "when authenticated" do

      context "with valid input" do
        it "saves a review" do
          post :create, business_id: business_id,
                        review: { "rating": "3", "content": "Meh." }
          expect(Review.count).to eq(1)
        end

        it "associates the correct business with the review" do
          post :create, business_id: business_id,
                        review: { "rating": "3", "content": "Meh." }
          expect(Review.first.business.id).to eq(business_id)
        end

        it "associates the current user with a new review"
        it "sets a flash success message"
      end

      context "with invalid input" do
        it "sets a flash error message"
      end
    end

    context "when not authenticated" do
      it "redirects to the home page"
      it "displays an error message"
    end
  end

  it "redirects to the business page" do
    post :create, business_id: business_id,
                  review: { "rating": "3", "content": "Meh." }
    expect(response).to redirect_to(business_path(business_id))
  end
end

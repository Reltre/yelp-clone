require 'rails_helper'

describe ReviewsController do
  let(:business_id) { Fabricate(:business).id }

  describe "POST create" do
    context "when authenticated" do
      before do
        set_current_user
      end

      it "redirects to the business page" do
        post :create, business_id: business_id,
                      review: Fabricate.attributes_for(:review)
        expect(response).to redirect_to(business_path(business_id))
      end

      context "with valid input" do
        it "saves a review" do
          post :create, business_id: business_id,
                        review: Fabricate.attributes_for(:review)
          expect(Review.count).to eq(1)
        end

        it "associates the correct business with the review" do
          post :create, business_id: business_id,
                        review: Fabricate.attributes_for(:review)
          expect(Review.first.business.id).to eq(business_id)
        end

        it "associates the current user with a new review" do
          post :create, business_id: business_id, user: current_user,
                        review: Fabricate.attributes_for(:review)
          expect(Review.first.user).to eq(current_user)
        end

        it "sets a flash success message" do
          post :create, business_id: business_id,
                        review: Fabricate.attributes_for(:review)
          is_expected.to(
            set_flash[:success].to("Your review was created successfully.")
          )
        end
      end

      context "with invalid input" do
        it "sets a flash error message" do
          post :create, business_id: business_id,
                        review: { "content": "Meh." }
          is_expected.to(
            set_flash[:danger].to("You must set a rating to make a review.")
          )
        end
      end
    end

    context "when not authenticated" do
      it_behaves_like 'require_log_in' do
        let(:action) do
          post :create, business_id: business_id,
                        review: Fabricate.attributes_for(:review)
        end
      end
    end
  end
end

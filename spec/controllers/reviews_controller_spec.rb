require 'rails_helper'

describe ReviewsController do
  describe "GET new" do
    let(:business_id) { Fabricate(:business).id }
    before { get :new, business_id: business_id }

    it { expect(assigns(:review)).to be_a_new(Review) }
  end
end

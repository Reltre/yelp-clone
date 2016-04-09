require 'rails_helper'

describe BusinessesController do
  describe "GET index" do
    it "sets businesses" do
      business1 = Fabricate(:business)
      business2 = Fabricate(:business)
      get :index
      expect(assigns(:businesses)).to match_array([business1, business2])
    end
  end

  describe "GET new" do
    before { set_current_user }

    it "sets a business" do
      get :new
      expect(assigns(:business)).to be_a_new(Business)
    end

    it_behaves_like 'require_log_in' do
      let(:action) do
        post :new
      end
    end
  end

  describe "POST create" do
    let(:business_params) { Fabricate.attributes_for :business }

    before { set_current_user }

    context "with valid input" do
      before do
        post :create, business: business_params
      end

      it "redirects to business show page" do
        business = Business.find_by_name(business_params[:name])
        expect(response).to redirect_to(business_path business)
      end

      it "saves a business" do
        expect(Business.count).to eq(1)
      end

      it "sets flash success" do
        should set_flash[:success].to('Your business was successfully created.')
      end
    end

    context "with invalid input" do
      it "sets flash danger" do
        post :create, business: business_params.merge(name: nil)
        should set_flash[:danger]
          .to("Something went wrong with creating your business.")
      end
    end

    it_behaves_like 'require_log_in' do
      let(:action) do
        post :create, business: business_params
      end
    end

  end

  describe "GET show" do
    let(:business) { Fabricate(:business) }

    before do
      get :show, id: business.id
    end

    it "sets business" do
      expect(assigns(:business)).to eq(business)
    end

    it "sets review" do
      expect(assigns(:review)).to be_a_new(Review)
    end
  end
end

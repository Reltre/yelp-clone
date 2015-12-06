require 'rails_helper'

describe BusinessesController do
  describe "GET new" do
    it "sets a business" do
      get :new
      expect(assigns(:business)).to be_a_new(Business)
    end
  end

  describe "POST create" do
    #Test associations later on for User.
    let(:business_params) { Fabricate.attributes_for :business }


    it "sets a business" do
      business = Fabricate.build(:business, name: nil)
      post :create, business: business.attributes
      expect(assigns(:business).attributes).to eq(business.attributes)
    end

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
        post :create, business: business_params.merge({name: nil})
        should set_flash[:danger].to("Something went wrong with creating your business.")
      end
    end

  end

  describe "GET show" do
    it "assigns business" do
      business = Fabricate(:business)
      get :show, id: business.id
      expect(assigns(:business)).to eq(business)
    end

    it "assigns reviews"
  end
end

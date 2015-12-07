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
    let(:time) do
      [[*'01'..'12'].sample, [*'01'..'60'].sample, [" AM", "PM"].sample]
    end

    context "with valid input" do
      before do
        post :create, business: business_params.merge({time_open: time, time_close: time})
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
        post :create, business: business_params.merge({name: nil, time_open:time, time_close: time})
        should set_flash[:danger].to("Something went wrong with creating your business.")
      end
    end

  end

  describe "GET show" do
    it "assigns business" do
      business = Fabricate(:business, time_open: Time.parse("12 00 PM"), time_close: Time.parse("1 00 PM"))
      get :show, id: business.id
      expect(assigns(:business)).to eq(business)
    end

    it "assigns reviews"
  end
end

require 'rails_helper'

describe SessionsController do

  describe "GET new" do
    it "should redirect to home a user is logged in" do
      set_current_user
      get :new
      expect(response).to redirect_to home_path
    end
  end

  describe "POST create" do
    context "with successful authentication" do

      let(:user) { Fabricate(:user) }

      before do
        post :create, email: user.email, password: user.password
      end

      it { expect(response).to redirect_to home_path }
      it { should set_session[:user_id].to(user.id) }
      it { should set_flash[:success].to "You've successfully logged in!" }

    end

    context "with unsuccessful authentication" do
      let(:user) { Fabricate(:user) }

      before do
        post :create, email: user.email, password: "badpassword"
      end

      it { should set_flash[:danger].to "Incorrect email or password" }
    end
  end

  describe "POST destroy" do
    before do
      post :destroy
    end

    it "sets the session user_id to nil" do
      Fabricate(:user)
      should set_session[:user_id].to be_nil
    end

    it { expect(response).to redirect_to home_path }
  end
end

require 'rails_helper'

describe SessionsController do

  describe "GET new" do
    it "should redirect to home if user is logged in" do
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
      it { is_expected.to set_session[:user_id].to(user.id) }
      it { is_expected.to set_flash[:success].to "You've successfully logged in!" }
    end

    context "with unsuccessful authentication" do
      let(:user) { Fabricate(:user) }

      before do
        post :create, email: user.email, password: "badpassword"
      end

      it { is_expected.to set_flash[:danger].to "Incorrect email or password" }
    end
  end

  describe "DELETE destroy" do
    before do
      set_current_user
      delete :destroy
    end

    it { is_expected.to set_session[:user_id].to be_nil }
    it { expect(response).to redirect_to home_path }
  end
end

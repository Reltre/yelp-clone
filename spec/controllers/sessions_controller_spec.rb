require 'rails_helper'

describe SessionsController do
  describe "POST create" do
    context "with successful authentication" do

      let(:user) { Fabricate(:user) }

      before do
        post :create, email: user.email, password: user.password
      end

      it { expect(response).to redirect_to home_path }
      it { should set_session[:user_id] }
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
end

require 'rails_helper'

describe ApplicationController do
  # Arbitrary RESTful actions created to test helper methods in the application controller.

  controller do
    def index
      current_user
      redirect_to home_path
    end

    def edit
      signed_in = signed_in?
      render plain: signed_in
    end

    def show
      require_sign_in
    end
  end


  describe "#current_user" do
    it "should set the current user" do
      user = Fabricate(:user)
      session[:user_id] = user.id
      get :index
      expect(assigns(:current_user)).to eq user
    end
  end

  describe "#signed_in?" do
    it "should return true if the user is signed in" do
      user = Fabricate(:user)
      session[:user_id] = user.id
      get :edit, id: user.id
      expect(response.body).to eq("true")
    end
  end

  describe "#require_sign_in" do
    before { get :show, id: 10 }

    it { should set_flash[:info].to "You must be logged in to access that page." }
    it { expect(response).to redirect_to(sign_in_path) }
  end
end

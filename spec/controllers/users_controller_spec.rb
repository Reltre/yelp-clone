require 'rails_helper'

describe UsersController do
  describe "GET new" do
    it "sets a new user" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "POST create" do
    context "with valid input" do
      it "redirects to the login page" do
        user_attributes = Fabricate.attributes_for(:user)
        post :create, user: user_attributes
        expect(response).to redirect_to sign_in_path
      end

      it "creates a new user" do
        user_attributes = Fabricate.attributes_for(:user)
        post :create, user: user_attributes
        expect(User.count).to eq(1)
      end
    end

    context "with invalid input" do
      it do
        post :create, user: { email: "", password: ""}
        is_expected.to set_flash[:danger].to("Invalid email or password")
      end
    end
  end

  describe "GET show" do
    it "sets the current user" do
      user = Fabricate(:user)
      get :show, id: user.id
      expect(assigns(:user)).to eq(user)
    end
  end
end

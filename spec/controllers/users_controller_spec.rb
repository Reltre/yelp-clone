require 'rails_helper'

describe UsersController do
  describe "GET new" do
    it "should set a new user" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "POST create" do
    it "should redirect to the login page with valid input" do
      user_attributes = Fabricate.attributes_for(:user)
      post :create, user: user_attributes
      expect(response).to redirect_to sign_in_path
    end

    it  "should create a new user withh valid input" do
      user_attributes = Fabricate.attributes_for(:user)
      post :create, user: user_attributes
      expect(User.count).to eq(1)
    end

    it "should set flash for incorrect email or password with invalid input"
  end

  describe "GET show" do
    before do
      set_current_user
    end

    it "should set past reviews for this user" do
      user = User.first
      2.times do
        user.reviews << Fabricate(:review)
      end
      get :show, id: user.id
      expect(assigns(:reviews)).to eq(current_user.reviews)
    end

    it "should set user information"
  end
end

require 'rails_helper'
#WIP
describe ApplicationController do
  describe "#current_user" do
    it "should set the current user" do
      user = Fabricate(:user)
      session[:user_id] = user.id
      get :current_user
      expect(assigns(:current_user)).to eq user.id
    end
  end
end

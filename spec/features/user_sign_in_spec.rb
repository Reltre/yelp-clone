require 'rails_helper'

feature "User Sign In" do
  given(:user) { Fabricate(:user) }

  scenario "with correct credentials" do
    sign_in(user)
    expect(current_path).to eq(home_path)
  end
end

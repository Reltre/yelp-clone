require 'rails_helper'

feature "User Sign In" do
  given(:user) { Fabricate(:user) }

  scenario "with correct credentials" do
    visit(sign_in_path)
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign In"
    expect(current_path).to eq(home_path)
  end
end

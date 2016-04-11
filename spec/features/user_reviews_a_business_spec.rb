require 'rails_helper'

feature "User views a business" do
  given!(:user) { Fabricate(:user) }
  given!(:business) { Fabricate(:business) }

  scenario "and makes a review" do
    sign_in(user)
    expect(current_path).to eq(home_path)
    within('#recent-businesses') do
      find('.business-row a:first-child').click
    end
    expect(current_path).to eq(business_path(business.id))
    click_link("+ New Review")
    fill_in("review_rating", with: "3")
    fill_in("review_content", with: "test12")
    click_button("Post Review")
    within("#business-show-reviews") do
      expect(page).to have_text "test12"
    end
  end
end

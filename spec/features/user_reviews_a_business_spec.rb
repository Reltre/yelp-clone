require 'rails_helper'

feature "User views a business" do
  given!(:user) { Fabricate(:user) }
  given!(:business) { Fabricate(:business) }

  scenario "and makes a review" do
    sign_in(user)
    expect(page).to have_text("+ New Business")
    navigate_to_business(business.id)
    expect(page).to have_text("+ New Review")
    create_review("3", "test12")
    expect_business_to_have_review("test12")
  end
end

def navigate_to_business(id)
  within('#recent-businesses') do
    find(:xpath, "//a[@href='/businesses/#{id}']").click
  end
end

def expect_business_to_have_review(text)
  within("#business-show-reviews-list") do
    expect(page).to have_text "test12"
  end
end

def create_review(rating, text)
  click_link("+ New Review")
  fill_in("review_rating", with: "3")
  fill_in("review_content", with: "test12")
  click_button("Post Review")
end

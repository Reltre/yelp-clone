require 'rails_helper'

feature "User navigates to a business" do
  given!(:user) { Fabricate(:user) }
  given!(:business) { Fabricate(:business) }

  scenario "User makes a review" do
    sign_in(user)
    expect(current_path).to eq(home_path)
    within('#recent-businesses') do
      find('.business-row a:first-child').click
    end
    expect(current_path).to eq(business_path(business.id))
  end
end

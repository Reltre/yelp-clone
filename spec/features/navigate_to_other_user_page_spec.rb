require 'rails_helper'

feature "View another user's page" do
  given!(:user) { Fabricate(:user, first_name: "Jane", last_name: "Robbins") }
  given!(:business) { Fabricate(:business) }
  given!(:review) { Fabricate(:review, user: user, business: business) }

  scenario "through a posted review" do
    visit home_path
    within('div#recent-reviews') do
      find('.review .col-md-5 h5 a', text: 'Jane Robbins').click
    end
    expect(current_path).to eq(user_path(user.id))
  end
end

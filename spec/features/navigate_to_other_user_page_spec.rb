require 'rails_helper'

feature "View another user's page" do
  given!(:user) { Fabricate(:user, first_name: "Jane", last_name: "Robbins") }
  given!(:business) { Fabricate(:business) }
  given!(:review) { Fabricate(:review, user: user, business: business) }

  scenario "through a posted review" do
    visit home_path
    go_to_user_page('Jane Robbins')
    expect(page).to have_text('Jane Robbins')
  end

  def go_to_user_page(name)
    within('div#recent-reviews') do
      find('.review .col-md-5 h5 a', text: name).click
    end
  end
end

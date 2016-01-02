class PagesController < ApplicationController

  def home
    @reviews = Review.limit(5)
    @businesses = Business.limit(5)
  end

  def sign_up
    render :sign_up
  end
end

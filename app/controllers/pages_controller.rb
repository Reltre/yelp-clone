class PagesController < ApplicationController

  def home
    @reviews = Review.limit(5)
    @businesses = Business.limit(5)
  end

end

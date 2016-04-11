class PagesController < ApplicationController
  def home
    @reviews = Review.order('created_at desc').limit(5)
    @businesses = Business.order('created_at desc').limit(5)
  end
end

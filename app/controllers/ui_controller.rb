class UiController < ApplicationController
  before_filter { redirect_to :root if Rails.env.production? }

  layout "application"
end

class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create #ajax this jazz after initial implementation
    review = Review.new(review_params)
    review.business_id = params[:business_id]
    review.save
    redirect_to business_path(params[:business_id])
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end

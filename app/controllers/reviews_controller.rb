class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create #ajax this jazz after initial implementation
    review = Review.new(review_params)
    review.business_id = params[:business_id]
    review.save ? flash[:success] = "Your review was created successfully." :
    flash[:danger] = "You must set a rating to make a review."
    redirect_to business_path(params[:business_id])
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end

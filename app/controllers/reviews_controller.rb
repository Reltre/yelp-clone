class ReviewsController < ApplicationController
  before_action :require_sign_in, only: [:create]

  def new
    @review = Review.new
  end

  def create #ajax this jazz after initial implementation
    review = Review.new(review_params)
    review.business_id = params[:business_id]
    review.user_id = current_user.id
    if review.save
      flash[:success] = "Your review was created successfully."
    else
      flash[:danger] = "You must set a rating to make a review."
    end
    redirect_to business_path(params[:business_id])
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end

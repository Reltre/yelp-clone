class ReviewsController < ApplicationController
  before_action :require_sign_in, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    review = Review.new(review_params.merge(business_id: params[:business_id],
                                            user_id:     current_user.id)
                       )
    if review.save
      flash[:success] = 'Your review was created successfully.'
    else
      flash[:danger] = 'You must set a rating to make a review.'
    end
    redirect_to business_path(params[:business_id])
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end

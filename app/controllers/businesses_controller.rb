class BusinessesController < ApplicationController
  before_action :require_sign_in, only: [:new, :create]

  def index
    session[:start] ||= 0
    @businesses = Business.all.limit(5)
    respond_to do |format|
      format.html
      format.js do
        business_size = Business.all.size
        session[:start] = if session[:start] >= business_size - 5
                            0
                          else
                            session[:start] + 5
                          end
        @businesses = Business.next_batch(session[:start])
      end
    end
  end

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(business_params)

    if @business.save
      flash[:success] = "Your business was successfully created."
      redirect_to business_path @business
    else
      flash.now[:danger] = "Something went wrong with creating your business."
      render :new
    end
  end

  def show
    @business  = Business.find(params[:id])
    @review = Review.new
  end

  private

  def business_params
    params.require(:business)
      .permit(
        :price_range, :name, :address, :description,
        :phone_number, time_open: [], time_close: []
      )
  end
end

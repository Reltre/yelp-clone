class BusinessesController < ApplicationController
  before_action :require_sign_in, only:[:create]

  def index
    @businesses = []
    Business.find_each { |business| @businesses << business }
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
      flash[:danger] = "Something went wrong with creating your business."
      render :new
    end
  end

  def show
    binding.pry
    @business  = Business.find(params[:id])
    @review = Review.new
    @reviews   = @business.reviews
    render :show
  end

  def edit
  end



  def update
  end

  def destroy
  end

  private

  def business_params
    params.require(:business)
          .permit(
            :price_range, :name, :address, :description,
            :phone_number, time_open:[], time_close:[]
          )
  end
end

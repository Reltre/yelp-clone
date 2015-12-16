class BusinessesController < ApplicationController
  def index
    @businesses = []
    Business.find_each { |business| @businesses << business }
  end

  def new
    @business = Business.new
    render :new
  end

  def create
    @business = Business.new(business_params)
    # binding.pry
    @business.normalize_time

    if @business.save
      flash[:success] = "Your business was successfully created."
      redirect_to business_path @business
    else
      flash[:danger] = "Something went wrong with creating your business."
      render :new
    end
  end

  def show
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

class PlantsController < ApplicationController
  before_action :set_plant, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index]

  def index
    if params[:query].present?
      @plants = policy_scope(Plant.search_by_name_species_address(params[:query]))
    else
      @plants = policy_scope(Plant).order(created_at: :desc)
    end
    @markers = @plants.geocoded.map do |plant|
    {
      lat: plant.latitude,
      lng: plant.longitude,
      info_window: render_to_string(partial: "info_window", locals: { plant: plant }),
      image_url: helpers.asset_url('pot-plant.svg')
    }
    end
  end

  def show
    authorize @plant
    @booking = Booking.new
    # @reviews_last = Review.last(3)
    @reviews_last = @plant.reviews.last(3)
  end

  def new
    @plant = Plant.new
    authorize @plant
  end

  def create
    @plant = Plant.new(plant_params)
    @plant.user = current_user
    authorize @plant
    if @plant.save
      redirect_to plant_path(@plant)
    else
      render :new
    end
  end

  def edit
    authorize @plant
  end

  def update
    @plant.update(plant_params)
    authorize @plant
    if @plant.update(plant_params)
      redirect_to plant_path(@plant)
    else
      render :edit
    end
  end

  def destroy
    authorize @plant
    @plant.destroy
    redirect_to plants_path
  end

  private

  def plant_params
    params.require(:plant).permit(:species, :name, :description, :address, photos: [])
  end

  def set_plant
    @plant = Plant.find(params[:id])
  end
end

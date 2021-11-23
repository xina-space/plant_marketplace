class PlantsController < ApplicationController
  before_action :set_plant, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: [:index,:show]
  def index
    @plants = Plant.all
    @plants = policy_scope(Plant).order(created_at: :desc)
  end

  def show
    authorize @plant
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
    if @plant.update
      redirect_to plant_path(@plant)
    else
      render :edit
    end
  end

  def destroy
    authorize @plant
    @plant.destroy
  end

  private

  def plant_params
    params.require(:plant).permit(:species, :name, :description)
  end

  def set_plant
    @plant = Plant.find(params[:id])
  end
end

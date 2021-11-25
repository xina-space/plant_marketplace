class ReviewsController < ApplicationController
  before_action :find_plant, except: :destroy
  before_action :find_user

  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.plant = @plant
    @review.user = current_user
    authorize @review
    if @review.save
      redirect_to plant_path(@plant)
    else
      render :new
    end
  end

  def destroy
    authorize @review
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to dashboard_myplants_path
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end

  def find_plant
    @plant = Plant.find(params[:plant_id])
  end

  def find_user
    @user = current_user.id
  end
end

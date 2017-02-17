class DosesController < ApplicationController

  before_action :find_cocktail, only: [:new]
  # before action set doses
  # before action set cocktail

  def new
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end




#   def create
#     # POST /restaurants/:restaurant_id/reviews
#     @restaurant = Restaurant.find(params[:restaurant_id])
#     @review = Review.new(review_params)
#     @review.restaurant = @restaurant

#     if @review.save
#       redirect_to restaurant_path(@restaurant)
#     else
#       render 'restaurants/show'
#     end
#   end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params
      .require(:dose)
      .permit(:description, :ingredient_id)
  end
end

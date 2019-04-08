class ReviewsController < ApplicationController
  before_action :set_cocktail, only: [:create, :new]
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.cocktail = @cocktail
    if @review.save
      redirect_to @cocktail
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @cocktail = @review.cocktail
    @review.destroy
    redirect_to @cocktail
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end

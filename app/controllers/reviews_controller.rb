class ReviewsController < ApplicationController
  before_action :set_review, only: [:destroy]

  def create
	  @product = Product.find(params[:product_id])
	  @product.reviews.create(review_params)
	  @product.save
	  redirect_to product_path(@product.id)
  end

  def destroy
	  @product = Product.find(params[:product_id])
	  @review = @product.reviews.find(params[:id])
	  @review.destroy
	  redirect_to product_path(@product.id)
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:author, :comment, :rating, :product_id)
    end
end

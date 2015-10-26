class ReviewsController < ApplicationController
	def create
		@product = Product.find(params[:product_id])
		@review = @product.reviews.build(reviews_params)
		if @review.save
			redirect_to @product, notice: "The product was created successfully"
		else
			redirect_to @product, alert: "The product wasn't created successfully"
		end
	end

	private
	def reviews_params
		params.require(:review).permit(:review)
	end
end


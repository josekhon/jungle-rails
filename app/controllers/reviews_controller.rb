class ReviewsController < ApplicationController


    def create
        @product = Product.find(params[:product_id])
        @review = @product.reviews.create(review_params)
        @review.user = current_user
    
        if @review.save
          redirect_to @product
        else
          render 'products/show'
        end
      end
      
      def destroy
        @product = Product.find(params[:product_id])
        @review = @product.reviews.find(params[:id])
        @review.destroy
        redirect_to product_path(@product)
      end
    
      private
    
      def review_params
        params.require(:review).permit(:rating, :description)
      end
    
     
    end

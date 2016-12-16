module Api
  module V1
    class  CategoriesController < ApplicationController
      before_action :set_category, only: [ :update, :destroy ]
      respond_to :json

      def index
        @categories=Category.all
       render json:@categories
      end

      def create
        @category= Category.new(category_params)
        if @category.save
          render json: @category
        end
      end

      def update
        if @category.update(category_params)
          respond_with(@category)
        end
      end

      def destroy
        @category.destroy
        respond_with(@category)
      end

      private
      def set_category
        @category = Category.find(params[:id])
      end
      def category_params
        params.require(:category).permit(:name)
      end
    end
  end
end
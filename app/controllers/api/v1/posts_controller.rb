module Api
  module V1
    class  PostsController < ApplicationController
      before_action :authorized!, except: [:show, :index]
      before_action :set_post, only: [:show, :update, :destroy]
      before_action :set_approved_post, only: [ :update, :destroy]
      respond_to :json

      def index
        @q=Post.approved.ransack(params[:q])
        @posts=@q.result.order('created_at desc').page(params[:page])
        render json: @posts
      end

      def show
        if @post.status.approved?
          @comments = @post.comments
          render json: [@post , @comments]
        else
          render json: {}, status: :not_found
        end
      end

      def create
        @post = Post.new(post_params)
        @post.user_id=@current_user.id

        if @post.save
          render json: @post, status: :created
        else
          render json: @post.errors, status: :unprocessable_entity
        end
      end

      def update
        if @post.update(post_params)
          render json: @post
        else
          render json: @post.errors, status: :unprocessable_entity
        end
      end

      def destroy
        if @post.destroy
          @post.comments.destroy
          render json: @post, status: :ok
        else
          render json: @post.errors, status: :not_found
        end
      end

      private


      def set_approved_post
        @post = Post.approved.find(params[:id])
      end
      def set_post
        @post = Post.find(params[:id])
      end
      def post_params
        params.require(:post).permit(:text, :category_id, :user_id)
      end
    end
  end
end
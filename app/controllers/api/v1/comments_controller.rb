module Api
  module V1
    class  CommentsController < ApplicationController
      before_action :set_post
      respond_to :json

      def index
        @post=Post.find(params[:id])
        @comments=@post.comments
        render json: @comments
      end

      def create
        @comment = @post.comments.new(comment_params)
        if @comment.save
          render json: @comment, status: :created
        else
          render json: @comment.errors, status: :unprocessable_entity
        end
      end

      private

      def set_post
        @post = Post.find(params[:post_id])
      end

      def comment_params
        params.require(:comment).permit(:text)
      end
    end
  end
end
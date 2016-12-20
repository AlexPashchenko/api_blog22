module Api
  module V1
    class UsersController < ApplicationController
      before_action :authorized!, only: [ :update, :destroy]
      respond_to :json

      def sign_in
        if User.exists?(params[:email])
          user = User.find_by(email)
          if user && user.password_encrypt?(user.password)
            render json: :success
            #check devise_name
            #than token
          else
            render json: {errors: "Pasford is not correct"}, status: :not_found
          end
        else
          render json:{errors: "Email not correct"}, status: :not_found
        end

      end

      def sign_out
        #need to regenerate token
        #delete current user

        render json: { success: true }
      end

      def show
        render json: user
      end

      def create
        user = User.new(user_params)
        if user.save
          #chek devise.name (presens or not)
          #save nev devise name and generate token

          render json: user, status: :created
        else
          render json: { errors: user.errors }, status: :unprocessable_entity
        end
      end

      def update
        if user.update(user_params)
          render json: user, status: :ok
        else
          render json: { errors: user.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        user.destroy
        head :no_content
      end

      private

      def user_params
        params.require(:user).permit(:name, :login, :age, :email, :password)
      end
    end
  end


end



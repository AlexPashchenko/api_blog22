Rails.application.routes.draw do


  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :categories
      resources :posts, only: [:index, :create, :show, :update, :destroy]  do
        resources :comments, only: [:index, :create]
      end
      resources :users, only: [:show, :create, :update, :destroy] do
        collection do
          post :sign_in
          delete :sign_out
        end
      end
    end
  end
end



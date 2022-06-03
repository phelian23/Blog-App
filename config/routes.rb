Rails.application.routes.draw do
  devise_for :users
  namespace :api , defaults: { format: :json } do
    namespace :v1 do
      post 'users/sign_in' => 'users#login'
      get 'posts' => 'posts#index'
      get 'comments' => 'comments#index'
      post 'comments/create' => 'comments#create'
    end
  end

  devise_scope :user do 
    get '/users/sign_out' => 'devise/sessions#destroy' 
  end

  root 'users#index'

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index new create show destroy]
  end

  resources :posts do
    resources :comments, only: %i[create new update destroy]
    resources :likes, only: %i[create]
  end
end

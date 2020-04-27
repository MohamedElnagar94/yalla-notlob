Rails.application.routes.draw do

  resources :friendships
  devise_for :users, controllers: {omniauth_callbacks: 'omniauth'}
  resources :homes
  resources :groups
  resources :group_friends
  resources :orders
  resources :order_details
  resources :notifications
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'homes#index'
  as :user do
# Customize root for user
    get "signin" => 'devise/sessions#new'
    delete "signout" => 'devise/sessions#destroy'
    get 'signup' => 'devise/registrations#new'
  end
end

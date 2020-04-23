Rails.application.routes.draw do
  get 'orders/index'
    resources :homes
    resources :groups
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    root 'homes#index'
    resources :orders
end

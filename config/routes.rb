Rails.application.routes.draw do
  get 'sales/index'
  get 'sales/show'
  get 'products/index'
  get 'products/show'
  get 'dashboard/index'
  devise_for :users
  root 'dashboard#index'
  resources :products, only: %i[index show]
  resources :sales, only: %i[index show]
  namespace :api do
    namespace :v1 do
      resources :products, only: %i[index show]
      resources :sales, only: %i[index show]
    end
  end
end

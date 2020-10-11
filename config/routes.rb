Rails.application.routes.draw do
  devise_for :users
  root to: 'notes#index'
  resources :notes
  resources :shop, only: [:new, :create, :index, :show, :edit]
end

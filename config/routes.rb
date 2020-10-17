Rails.application.routes.draw do
  devise_for :users
  root to: 'notes#index'
  resources :users, only: [:show, :edit, :update]
  get '/mypage' => 'users#mypage'
  resources :notes
  resources :shops
end
Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users
  resources :notes

  root to: 'pages#home'
end

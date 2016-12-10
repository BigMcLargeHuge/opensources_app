Rails.application.routes.draw do

  resources :submissions
  devise_for :users
  resources :home

  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

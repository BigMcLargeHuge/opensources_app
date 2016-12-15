Rails.application.routes.draw do

  # devise_for :users
  resources :submissions
  # devise_for :users
  resources :home

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # devise_scope :user do
  #   # :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  #   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end

  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

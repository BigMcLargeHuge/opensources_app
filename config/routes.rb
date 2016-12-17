Rails.application.routes.draw do

  get '/terms', to: "home#terms"
  get '/privacy', to: "home#privacy"

  resources :issues
  # devise_for :users
  resources :submissions
  # devise_for :users
  resources :home

  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # devise_scope :user do
  #   # :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  #   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end

  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

# frozen_string_literal: true

Rails.application.routes.draw do
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/help", to: "static_pages#help"
  get "/about", to: "static_pages#about"

  resources :users
  resources :documents
  resources :comments

  root "static_pages#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

# frozen_string_literal: true

Rails.application.routes.draw do
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/help", to: "static_pages#help"
  get "/about", to: "static_pages#about"

  resources :users do
    member do
      get "friendlist", as: "friendlist"
    end
    member do
      get "viewed_documents"
    end
    member do
      get "downloaded_documents"
    end
  end

  resources :documents do
    member do
      get "download_pdf"
    end
  end
  
  resources :comments
  resources :requests
  resources :histories
  resources :categories
  resources :category_relationships
  resources :follow_relationships
  resources :favorites, only: [:create, :destroy]

  namespace :admin do
    resources :requests, only: [:index, :update]
    resources :users do
      member do
        patch :update_role, as: "update_role"
        get "reason", as: "reason"
      end
    end
  end

  root "static_pages#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

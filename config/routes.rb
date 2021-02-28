# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#home'
  get '/signup', to: 'users#signup'
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'

  resources :users do
    resources :words, only: [:index]
  end
  resources :contacts
  resources :sessions, only: [:create]
  resources :relationships
  resources :categories
  resources :words
  resources :lessons do
    resources :answers
  end

  namespace :admin do
    resources :users
    resources :contacts
    resources :categories do
      resources :words
    end
  end
end

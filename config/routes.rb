# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: 'auth'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[ show index destroy ]
  resources :books
  root to: 'users#index'
end

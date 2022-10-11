# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'categories#index'

  resources :categories

  resources :folders

  resources :articles
  post '/articles/new/:article_id/:clone', to: 'articles#new'
end

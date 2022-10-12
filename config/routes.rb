# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'categories#index'

  resources :categories

  resources :folders

  resources :articles
  post '/articles/:article_id', to: 'articles#new'
  get '/articles/get_soln_article/:ticket_id/:title/:redirect_to', to: 'articles#solution_article_new'

  resources :tickets
  get '/tickets/redirect/:ticket_id', to: 'tickets#redirect'

  resources :notes
  get '/notes/new/:ticket_id', to: 'notes#new'

  resources :replies
  get '/replies/new/:ticket_id', to: 'replies#new'
end

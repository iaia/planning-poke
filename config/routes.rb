# frozen_string_literal: true

Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  resources :users, only: :create
  resources :rooms, only: %i[new index create show]
  resources :messages, only: %i[new create]

  root to: 'users#new'
end

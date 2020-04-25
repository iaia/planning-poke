# frozen_string_literal: true

Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  resource :rooms

  root to: 'rooms#new'
end

# frozen_string_literal: true

Rails.application.routes.draw do
  resources :routes, only: [:index, :show] do
    resources :trips, only: [] do
      resources :deliveries, only: [:create]
    end
  end
end

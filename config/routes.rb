# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :routes, only: %i[index show create]
      # resources :trips, only: %i[index show create]
      # resources :deliveries, only: %i[index show create]
    end
  end
end

# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :routes, only: %i[show] do
        resources :trips, only: %i[create] do
          resources :deliveries, only: %i[create]
        end
      end
    end
  end
end

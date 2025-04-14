# frozen_string_literal: true

Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check

  namespace :v1 do
    resources :users, only: %i[create]
    resource :session, only: %i[create destroy]
  end
end

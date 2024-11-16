# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, only: [:index] do
    collection do
      get 'populate_filter_options'
      post 'filter_users'
    end
  end

  root 'users#index'
end

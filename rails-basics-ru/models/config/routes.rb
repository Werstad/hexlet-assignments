# frozen_string_literal: true

Rails.application.routes.draw do
  # BEGIN
  root 'home#index'

  resources :articles, only: %i[index show]
  # END
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

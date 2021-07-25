Rails.application.routes.draw do
  resources :providers, only: [:index, :show, :update, :edit]
  root to: 'providers#index'
end

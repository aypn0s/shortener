Rails.application.routes.draw do
  resources :providers, only: [:index, :show, :update, :edit]
  post 'shorten', to: 'api#shorten'
  root to: 'providers#index'
end

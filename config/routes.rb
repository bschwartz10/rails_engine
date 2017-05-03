Rails.application.routes.draw do
  get '/api/v1/merchants/find', to: 'api/v1/merchants/find#show', as: 'api_v1_merchants_find'
  get '/api/v1/merchants/find_all', to: 'api/v1/merchants/find#index', as: 'api_v1_merchants_finds'


  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :merchants, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resources :customers, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
      resources :invoices, only: [:index, :show]
    end
  end
end

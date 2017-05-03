Rails.application.routes.draw do
  get '/api/v1/merchants/find', to: 'api/v1/merchants/find#show', as: 'api_v1_merchants_find'
  get '/api/v1/merchants/find_all', to: 'api/v1/merchants/find#index', as: 'api_v1_merchants_finds'

  get '/api/v1/transactions/find', to: 'api/v1/transactions/find#show', as: 'api_v1_transactions_find'
  get '/api/v1/transactions/find_all', to: 'api/v1/transactions/find#index', as: 'api_v1_transactions_finds'

  get '/api/v1/customers/find', to: 'api/v1/customers/find#show', as: 'api_v1_customers_find'
  get '/api/v1/customers/find_all', to: 'api/v1/customers/find#index', as: 'api_v1_customers_finds'


  get '/api/v1/merchants/find', to: 'find#show', as: 'api_v1_merchants_find'


  namespace :api, defaults: { format: :json } do
    namespace :v1 do

      resources :merchants, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resources :customers, only: [:index, :show]

      namespace :items do
        get "/find", to: "find#show"
        get "/find_all", to: "find#index"
      end
      resources :items, only: [:index, :show] do
        #other routes here
      end

      namespace :invoice_items do
        get "/find", to: "find#show"
        get "/find_all", to: "find#index"
      end
      resources :invoice_items, only: [:index, :show] do
        #other routes here
      end

      namespace :invoices do
        get "/find", to: "find#show"
        get "/find_all", to: "find#index"
      end
      resources :invoices, only: [:index, :show] do
        #other routes here
      end

    end
  end
end

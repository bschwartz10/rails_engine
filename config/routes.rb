Rails.application.routes.draw do

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

Rails.application.routes.draw do


  namespace :api, defaults: { format: :json } do
    namespace :v1 do

      namespace :items do
        get "/find", to: "find#show"
        get "/find_all", to: "find#index"
        get "/random", to: "random#show"
      end
      resources :items, only: [:index, :show] do
        get "/invoices", to: "items_invoice_items#show"
        get "/merchant", to: "items_merchants#show"
      end

      namespace :invoice_items do
        get "/find", to: "find#show"
        get "/find_all", to: "find#index"
        get "/random", to: "random#show"
      end
      resources :invoice_items, only: [:index, :show] do
        get "/invoice", to: "invoice_items_invoice#show"
        get "/item", to: "invoice_items_item#show"
      end

      namespace :invoices do
        get "/find", to: "find#show"
        get "/find_all", to: "find#index"
        get "/random", to: "random#show"
      end
      resources :invoices, only: [:index, :show] do
        get "/transactions", to: "invoice_transactions#show"
        get "/invoice_items", to: "invoice_invoice_items#show"
        get "/items", to: "invoice_items#index"
        get "/merchants", to: "invoice_merchants#show"
        get "/customers", to: "invoice_customers#show"
      end

      namespace :merchants do
        get "/find", to: "find#show"
        get "/find_all", to: "find#index"
        get "/random", to: "random#show"
      end
        resources :merchants, only: [:index, :show] do
          get "/items", to: "merchant_items#show"
          get "/invoices", to: "merchant_invoices#show"
      end

      namespace :transactions do
        get "/find", to: "find#show"
        get "/find_all", to: "find#index"
        get "/random", to: "random#show"
      end
        resources :transactions, only: [:index, :show] do
          get "/invoice", to: "transactions_invoice#show"

      end
      namespace :customers do
        get "/find", to: "find#show"
        get "/find_all", to: "find#index"
        get "/random", to: "random#show"
      end
        resources :customers, only: [:index, :show] do
          get "/invoices", to: "customers_invoices#show"
          get "/transactions", to: "customers_transactions#show"
      end
    end
  end
end

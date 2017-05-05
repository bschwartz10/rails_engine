Rails.application.routes.draw do


  namespace :api, defaults: { format: :json } do
    namespace :v1 do

      namespace :items do
        get "/find", to: "find#show"
        get "/find_all", to: "find#index"
        get "/random", to: "random#show"
        get "/most_items", to: "most_items#index"
      end
      resources :items, only: [:index, :show] do
        get "/invoice_items", to: "items/items_invoice_items#show"
        get "/merchant", to: "items/items_merchants#show"
      end

      namespace :invoice_items do
        get "/find", to: "find#show"
        get "/find_all", to: "find#index"
        get "/random", to: "random#show"
      end
      resources :invoice_items, only: [:index, :show] do
        get "/invoice", to: "invoice_items/invoice_items_invoice#show"
        get "/item", to: "invoice_items/invoice_items_item#show"
      end

      namespace :invoices do
        get "/find", to: "find#show"
        get "/find_all", to: "find#index"
        get "/random", to: "random#show"
      end
      resources :invoices, only: [:index, :show] do
        get "/transactions", to: "invoices/invoice_transactions#show"
        get "/invoice_items", to: "invoices/invoice_invoice_items#show"
        get "/items", to: "invoices/invoice_and_items#show"
        get "/merchant", to: "invoices/invoice_merchants#show"
        get "/customer", to: "invoices/invoice_customers#show"
      end

      namespace :merchants do
        get "/find", to: "find#show"
        get "/find_all", to: "find#index"
        get "/random", to: "random#show"
        get "/most_revenue", to: "merchant_most_revenue#index"
        get "/most_items", to: "merchant_most_items#index"
        get "/revenue", to: "merchants_revenue_by_date#index"
      end
        resources :merchants, only: [:index, :show] do
          get "/items", to: "merchants/merchant_items#show"
          get "/invoices", to: "merchants/merchant_invoices#show"
          get "/revenue", to: "merchants/single_merchant_revenue#show"
          get "/favorite_customer", to: "merchants/single_merchant_favorite_customer#show"
      end

      namespace :transactions do
        get "/find", to: "find#show"
        get "/find_all", to: "find#index"
        get "/random", to: "random#show"
      end
        resources :transactions, only: [:index, :show] do
          get "/invoice", to: "transactions/transactions_invoice#show"

      end
      namespace :customers do
        get "/find", to: "find#show"
        get "/find_all", to: "find#index"
        get "/random", to: "random#show"
      end
        resources :customers, only: [:index, :show] do
          get "/invoices", to: "customers/customers_invoices#show"
          get "/transactions", to: "customers/customers_transactions#show"
          get "/favorite_merchant", to: "customers/favorite_merchant#show"
      end
    end
  end
end

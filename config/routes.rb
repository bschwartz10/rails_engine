Rails.application.routes.draw do


  namespace :api, defaults: { format: :json } do
    namespace :v1 do

      namespace :items do
        get "/find", to: "find#show"
        get "/find_all", to: "find#index"
        get "/random", to: "random#show"
      end
      resources :items, only: [:index, :show] do
      end

      namespace :invoice_items do
        get "/find", to: "find#show"
        get "/find_all", to: "find#index"
      end
      resources :invoice_items, only: [:index, :show] do
      end

      namespace :invoices do
        get "/find", to: "find#show"
        get "/find_all", to: "find#index"
      end
      resources :invoices, only: [:index, :show] do
      end

      namespace :merchants do
        get "/find", to: "find#show"
        get "/find_all", to: "find#index"
        get "/random", to: "random#show"
      end
        resources :merchants, only: [:index, :show] do

      end

      namespace :transactions do
        get "/find", to: "find#show"
        get "/find_all", to: "find#index"
        get "/random", to: "random#show"
      end
        resources :transactions, only: [:index, :show] do

      end
      namespace :customers do
        get "/find", to: "find#show"
        get "/find_all", to: "find#index"
        get "/random", to: "random#show"
      end
        resources :customers, only: [:index, :show] do

      end
    end
  end
end

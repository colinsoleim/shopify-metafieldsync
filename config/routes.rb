Rails.application.routes.draw do
  mount ShopifyApp::Engine, at: "/"

  require "sidekiq/web"
  mount Sidekiq::Web => "/sidekiq"

  resources :related_shops, only: [:index, :new, :create]
  resources :shops, only: [:edit, :update]
  resources :shop_syncs, only: [:index, :show]
  resources :autosync_runners, only: [:index, :new, :create, :show]

  root to: "dashboard#show"
end

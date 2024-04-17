Rails.application.routes.draw do
  resources :articles
  resources :app_banners
  resources :game_awards
  get "up" => "rails/health#show", as: :rails_health_check

  root "main#index"
  get "/offers/:app_offer_id" => "main#offer"
  post "/offers/:app_offer_id" => "referrers#create"
  get "/refer" => "main#refer"
  get "/refer/:app_offer_id" => "main#refer"
  resources :app_offers
  resources :referrers
  resources :affiliates
  resources :campaign_infos

end

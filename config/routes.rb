Rails.application.routes.draw do

  get "up" => "rails/health#show", as: :rails_health_check

  root "main#index"
  
  get "/offers/:app_offer_id" => "main#offer"
  post "/offers/:app_offer_id" => "referrers#create"
  get "/refer" => "main#refer"
  get "/refer/:app_offer_id" => "main#refer"
  get "/referral" => "main#referral"
  get "/profile" => "main#profile"
  get "/postback" => "main#postback"
  post "/profile" => "app_redeems#create"
  get "/logout" => "main#logout"
  get 'google_login' => "logins#google_login"
  get "/gameaward/:award_id" => "gameaward#index"
  post "/gameaward/:award_id" => "gameaward#create"
  get '/admin' => 'admin/manager#new'
  post '/admin' => 'admin/manager#create'
  get '/admin/logout' => 'admin/manager#destroy'
 
 namespace :admin do 

  resources :campaign_infos
  resources :app_offers
  resources :referrers
  resources :affiliates     
  resources :articles
  resources :app_banners
  resources :game_awards
  resources :list_redeems
   
 end

  get "/admin/app_offers/:app_offer_id/edit/event/new" => "admin/event#new"
  post "/admin/app_offers/:app_offer_id/edit/event/new" => "admin/event#create"
  get "/admin/app_offers/:app_offer_id/edit/event/:event_id/edit" => "admin/event#edit"
  post "/admin/app_offers/:app_offer_id/edit/event/:event_id/edit" => "admin/event#update"
  get "/admin/app_offers/:app_offer_id/edit/event/:event_id/" => "admin/event#destroy"

  get "/admin/game_rewards/" => "admin/game_rewards#index"
  get "/admin/app_redeems/" => "admin/list_redeems#index"
  get "/admin/app_redeems/:id/" => "admin/list_redeems#show"
  get "/admin/app_redeems/:id/edit" => "admin/list_redeems#edit"
  post "/admin/app_redeems/:id/edit" => "admin/list_redeems#update"
  get "/admin/ref_user/:id" => "admin/ref_user#show"
  get "/admin/postbacks" => "admin/event_postbacks#index"

  post "/payout" => "list_redeems#payout"

end
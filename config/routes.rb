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
  get '/admin' => 'manager#new'
  post '/admin' => 'manager#create'
  get '/admin/logout' => 'manager#destroy'
 
  resources :campaign_infos, path: "/admin/campaign_infos"
  resources :app_offers,     path: "/admin/app_offers"
  resources :referrers,      path: "/admin/referrers"
  resources :affiliates,     path: "/admin/affiliates"
  resources :articles,       path: "/admin/articles"
  resources :app_banners,    path: "/admin/app_banners"
  resources :game_awards,    path: "/admin/game_awards"
  resources :list_redeems


  get "/admin/app_offers/:app_offer_id/edit/event/new" => "event#new"
  post "/admin/app_offers/:app_offer_id/edit/event/new" => "event#create"
  get "/admin/app_offers/:app_offer_id/edit/event/:event_id/edit" => "event#edit"
  post "/admin/app_offers/:app_offer_id/edit/event/:event_id/edit" => "event#update"
  get "/admin/app_offers/:app_offer_id/edit/event/:event_id/" => "event#destroy"

  get "/admin/game_rewards/" => "game_rewards#index"
  get "/admin/app_redeems/" => "list_redeems#index"
  get "/admin/app_redeems/:id/" => "list_redeems#show"
  get "/admin/app_redeems/:id/edit" => "list_redeems#edit"
  post "/admin/app_redeems/:id/edit" => "list_redeems#update"
  get "/admin/ref_user/:id" => "ref_user#show"
  get "/admin/postbacks" => "event_postbacks#index"

  post "/payout" => "list_redeems#payout"

end
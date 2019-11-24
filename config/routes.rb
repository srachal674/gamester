Rails.application.routes.draw do
  devise_for :users
  root "games#index"
  resources :games
  get '/search' => 'pages#search', :as => 'search_page'
end
Rails.application.routes.draw do

  devise_for :users, :controllers => {
    registrations: 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords',
    :confirmations => 'users/confirmations'
  }

  authenticate :user do
    namespace :users do
      resources :users
      get '/dashboard' => 'dashboards#index', as: :dashboard
      root :to => 'dashboards#index'
      get "*unmatched_route", :to => "application#page_missing"
    end
  end

  devise_for :managers, :controllers => {
    registrations: 'managers/registrations',
    :sessions => "managers/sessions",
    :passwords => 'managers/passwords',
    :confirmations => 'managers/confirmations'
  }

  authenticate :manager do
    namespace :managers do
      resources :managers
      resources :plans
      resources :users
      get '/dashboard' => 'dashboards#index', as: :dashboard
      root :to => 'dashboards#index'
      get "*unmatched_route", :to => "application#page_missing"
    end
  end

  root 'pages#index'
  get "*unmatched_route", :to => "application#page_missing"
end

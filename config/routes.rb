Rails.application.routes.draw do

  root 'pages#index'
  get "*unmatched_route", :to => "application#page_missing"
end

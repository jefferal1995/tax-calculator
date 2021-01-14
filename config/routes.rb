Rails.application.routes.draw do
  devise_for :users

  resources :tax_rules
  resources :tax_calculations

  root to: 'pages#home'
end

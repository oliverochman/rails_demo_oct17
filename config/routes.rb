Rails.application.routes.draw do
  #get 'landing/index'

  resources :articles

  root 'landing#index'
end

Rails.application.routes.draw do

  root to: 'urls#new'
  resources :urls, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

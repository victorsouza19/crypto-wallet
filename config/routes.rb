Rails.application.routes.draw do
  # get 'welcome/index'
  root to: 'welcome#index'

  resources :coins
  # get '/coins', to: 'coins#index'

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

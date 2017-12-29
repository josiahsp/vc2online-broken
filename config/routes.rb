Rails.application.routes.draw do
  resources :events
  resources :services
  get 'services/index'

  get 'services/new'

  get 'services/edit'

  get 'services/delete'

  resources :meetings
  resources :locations
  resources :pages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'pages#index'
end

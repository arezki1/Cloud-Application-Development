Rails.application.routes.draw do
  resources :jobs
  resources :recruiters
  resources :agencies
  root 'dashboard#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
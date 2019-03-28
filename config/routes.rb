Rails.application.routes.draw do
  #get 'users/show'
  devise_for :users
  resources :jobs
  resources :recruiters
  resources :agencies
  resources :users

  root 'dashboard#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

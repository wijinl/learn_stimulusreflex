Rails.application.routes.draw do
  root 'todos#index'
  resources :people
  resources :messages
  resources :todos
  resource :nogood
  resource :note
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

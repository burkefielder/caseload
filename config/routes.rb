Rails.application.routes.draw do
  resources :sessions
  root 'students#index'
  resources :students
end

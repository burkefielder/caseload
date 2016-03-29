Rails.application.routes.draw do
  resources :users
  root 'students#index'
  resources :students do
    resources :sessions
  end
end

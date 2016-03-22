Rails.application.routes.draw do
  root 'students#index'
  resources :students do
    resources :sessions
  end
end

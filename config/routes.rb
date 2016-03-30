Rails.application.routes.draw do
  resource :s_session

  resources :users

  root 'students#index'

  resources :students do
    resources :sessions
  end
end

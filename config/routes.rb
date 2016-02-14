Rails.application.routes.draw do
  resources :user_sessions
  resources :users

  get "user_sessions/new"

  get "user_sessions/create"

  get "user_sessions/destroy"

  get "login" => "user_sessions#new", as: :login
  get "logout" => "user_sessions#destroy", as: :logout

  root to: "user_sessions#new"
end

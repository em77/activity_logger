Rails.application.routes.draw do
  resources :user_sessions
  resources :users
  resources :logs
  resources :pages

  get "/process_log" => "logs#toggle_processed", as: "process_log"

  get "user_sessions/new"

  get "user_sessions/create"

  get "user_sessions/destroy"

  get "/destroy_logs" => "logs#destroy_logs", as: "destroy_logs"

  post "users/new"

  get "login" => "user_sessions#new", as: :login
  get "logout" => "user_sessions#destroy", as: :logout

  root to: "pages#index"
end

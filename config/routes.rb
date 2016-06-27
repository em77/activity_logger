Rails.application.routes.draw do
  
  if ENV['ACME_KEY'] && ENV['ACME_TOKEN']
    get ".well-known/acme-challenge/#{ ENV["ACME_TOKEN"] }" =>
      proc { [200, {}, [ ENV["ACME_KEY"] ] ] }
  else
    ENV.each do |var, _|
      next unless var.start_with?("ACME_TOKEN_")
      number = var.sub(/ACME_TOKEN_/, '')
      get ".well-known/acme-challenge/#{ ENV["ACME_TOKEN_#{number}"] }" =>
        proc { [200, {}, [ ENV["ACME_KEY_#{number}"] ] ] }
    end
  end

  get 'password_resets/create'

  get 'password_resets/edit'

  get 'password_resets/update'

  resources :user_sessions
  resources :users
  resources :logs
  resources :password_resets

  get "/process_log" => "logs#toggle_processed", as: "process_log"

  get "user_sessions/new"

  get "user_sessions/create"

  get "user_sessions/destroy"

  get "/destroy_logs" => "logs#destroy_logs", as: "destroy_logs"

  post "users/new"

  get "login" => "user_sessions#new", as: :login
  get "logout" => "user_sessions#destroy", as: :logout

  get "pages" => "pages#index"
  get "pages/guide"

  root to: "pages#index"
end

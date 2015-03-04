App::Application.routes.draw do
  root to: 'layouts#index'

  namespace :api do
    get '/me', to: 'me#index'
    put '/me', to: 'me#update'

    post '/sessions/login', to: 'sessions#login'
    get '/sessions/logout', to: 'sessions#logout'

    resources :users
    resources :samples
  end

  match '*path', to: 'layouts#index', via: [:get, :post, :put, :delete]
end

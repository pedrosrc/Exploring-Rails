Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations", omniauth_callbacks: 'omniauth_callbacks'}

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end
  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
  end
  devise_scope :user do
    delete 'logout', to: 'devise/sessions#destroy'
  end

  root "articles#index"

  resources :articles do
    resources :comments
  end

  get 'user/index'
  get '/user', to: 'user#index'
  get "/articles", to: "articles#index"
  get "/articles/:id", to: "articles#show"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end

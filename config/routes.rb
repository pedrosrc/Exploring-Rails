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

  root to: "articles#index"

  resources :articles do
    resources :comments
  end

  get 'user/index'
  get '/user', to: 'user#index'
  get "/articles", to: "articles#index"
  get "/articles/:id", to: "articles#show"

  get "up" => "rails/health#show", as: :rails_health_check
end

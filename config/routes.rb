Rails.application.routes.draw do

  root to: "groups#index"

  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :users, only: [:show]

  if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :groups do
    collection do
      post 'add_menber'
    end
  end

  resources :pets do
    resources :comments
    resources :wraps
  end
end

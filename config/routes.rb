Rails.application.routes.draw do

  get 'relationships/create'
  get 'relationships/destroy'
  root to: "groups#index"
  get 'static_pages/home'
  get 'static_pages/about'

  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: 'users/omniauth_callbacks',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  resources :users, only: [:index, :show]
  resources :relationships, only: [:create, :destroy]

  if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :groups do
    collection do
      post 'add_member'
      post 'change_owner'
      delete 'delete_member'
    end
  end

  resources :pets do
    resources :comments
    resources :wraps
  end
end

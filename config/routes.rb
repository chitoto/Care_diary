Rails.application.routes.draw do
  root to: "groups#index"

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
  resources :users, only: [:show]

  if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :groups do
    resources :assigns, only: [:create, :destroy]
    resources :pets do
      collection do
        post :confirm
      end
      resources :wraps do
      end
    end
  end

end

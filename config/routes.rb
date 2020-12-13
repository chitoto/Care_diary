Rails.application.routes.draw do
  root to: "pets#index"

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  resources :users, only: [:show]

  if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :groups 

  resources :pets do
    collection do
      post :confirm
    end
    resources :wraps do
    end
  end

end

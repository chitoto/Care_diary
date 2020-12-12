Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  resources :users, only: [:show]

  if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  root to: "pets#index"
  resources :pets do
    collection do
      post :confirm
    end
    resources :wraps do
    end
  end

end

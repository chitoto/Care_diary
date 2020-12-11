Rails.application.routes.draw do
  devise_for :users
  # Rails.application.routes.draw do
  #     devise_for :users, controllers: {
  #       sessions: 'users/sessions'
  #     }
  #   end

  if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  root to: "pets#index"
  resources :pets do
    collection do
      post :confirm
    end
  end
end

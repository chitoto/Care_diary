Rails.application.routes.draw do
  resources :wraps
  devise_for :users
  resources :pets

  if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end

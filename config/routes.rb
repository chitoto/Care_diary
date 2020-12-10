Rails.application.routes.draw do
  root to: "pets#index"
  resources :pets do
    collection do
      post :confirm
    end
  end
end

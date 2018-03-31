Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, defaults: { format: :json }, only: [:index]

  root to: "pages#index"
end

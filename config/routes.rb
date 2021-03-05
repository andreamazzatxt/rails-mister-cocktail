Rails.application.routes.draw do
  get 'doses/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'cocktails#index'
  resources :cocktails, only: %i[index show new create] do
    resources :doses, only: %i[create]
  end
  resources :doses, ony: %i[delete]
end

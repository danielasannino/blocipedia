Rails.application.routes.draw do

 root 'welcome#index'

  get 'charges/create'
  devise_for :users
  get 'welcome/about', to: 'welcome#about'

  resources :wikis

  resources :wikis do
    resources :collaborators, only: [:new, :create, :destroy]
  end

 resources :charges, only: [:new, :create]

  resources :users, only: [:index, :show] do
    member do
      post :downgrade
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

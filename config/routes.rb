Rails.application.routes.draw do
  resources :wikis
  resources :wikis do
      resources :collaborators, only: [:new, :create, :destroy, :index]
  end
  resources :charges, only: [:new, :create, :destroy]
  devise_for :users

  get 'about' => 'welcome#about'
  root 'welcome#index'
end

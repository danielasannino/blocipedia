Rails.application.routes.draw do
  devise_for :models
  get 'welcome/index'

  get 'welcome/about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

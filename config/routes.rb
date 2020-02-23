Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   'wash#index'

  get 'wash/index'
  get 'wash', to: 'wash#index'
  post 'wash/index'
  post 'wash', to: 'wash#index'
end

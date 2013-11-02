SignInEasy::Application.routes.draw do

  root :to => "clearance/sessions#new"

  get 'profile', to: 'users#show', as: "user"

  resources :organizations, only: [:show]
end

SignInEasy::Application.routes.draw do

  get "static_pages/splash"
  root :to => "clearance/sessions#new"

  get 'profile', to: 'users#show', as: "user"

  resources :organizations, only: [:show] do
    resource :member_directory, only: [:show]
    resources :guests, only: [:new, :index]  
    get "static_pages/dashboard" 
  end
  resources :guests, only: [:create]

  get "admin_panel", to: "admin#show", as: "admin_panel"

end

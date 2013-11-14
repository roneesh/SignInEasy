SignInEasy::Application.routes.draw do

  get "admin/show"
  get "static_pages/splash"
  root :to => "clearance/sessions#new"

  get 'profile', to: 'users#show', as: "user"

  resources :organizations, only: [:destroy, :show, :update ] do
    resource :member_directory, only: [:show]
    resources :guests, only: [:new, :index]  
    get "static_pages/dashboard" 
  end
  resources :guests, only: [:create]

  #To make admin delete links work, one for each class displayed there
  delete "admin/organizations/:id", to: "organizations#destroy"
  get "admin/organization/new", to: "organizations#new"

end
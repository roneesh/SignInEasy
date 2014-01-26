SignInEasy::Application.routes.draw do

  get "static_pages/splash"
  get "/index", to: 'static_pages#index'
  root :to => "clearance/sessions#new"

  get 'profile', to: 'guests#login_redirect', as: "profile"

  resources :organizations, only: [:destroy, :show, :update, :create ] do
    resources :employees do 
      collection { get :import_form; post :import}
    end
    resource :member_directory, only: [:show]
    resources :guests, only: [:new, :show, :index, :destroy] do
      get :autocomplete_employee_name, :on => :collection
    end
  end
  resources :guests, only: [:create]


  #ADMIN LINKS
  get "admin/index"

  delete "admin/organizations/:id", to: "organizations#destroy"
  get "admin/organization/new", to: "organizations#new"

  get 'admin/user/new', to: 'users#new'

  get 'admin/organizationuser/new', to: "organization_users#new"
  post 'organization_user', to: "organization_users#create", as: "organization_users"
  delete 'admin/organizationusers/:id', to: "organization_users#destroy"

  get 'admin/employee/new', to: 'employees#new'
  post 'employee', to: 'employees#create', as: "employees"
  delete 'admin/employees/:id', to: 'employees#destroy'

  get 'admin/servicelist/new', to: 'service_lists#new'
  post 'service_list', to: 'service_lists#create', as: 'service_lists'
  delete 'admin/servicelists/:id', to: 'service_lists#destroy'

end

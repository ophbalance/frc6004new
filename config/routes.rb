Timesheet::Application.routes.draw do
  resources :flex_hours
  resources :colleges
  resources :requirements
  resources :messages
  resources :weeks
  resources :week_exceptions
  resources :computers

  resources :hour_exceptions


  resources :hour_overrides


  resources :years


  resources :forms_users


  resources :forms


  get "stats/hours"
  post "stats/hours"
  get "stats/schools"
  post "stats/schools"
  get "stats/gender"
  post "stats/gender"

  resources :schools


  resources :timelogs 
  resources :laptimelogs
  resources :users, only: [:index, :remove, :show, :edit, :new, :create, :update, :destroy,]
  resources :sessions

  get "welcome/index"
  
  match 'studentlogin' => 'timelogs#student', via: [:get, :post]
  match 'assetlogin' => 'laptimelogs#computer', via: [:get, :post]
  get 'welcome/acknowledgements' => 'welcome#acknowledgements', :as=> :credits
  
  get 'currentStudents' => 'users#current', :as=>"students"
  match 'studentForms' => 'users#forms', :as=>"student_forms", via: [:get, :post]
  get 'currentStudentHours' => 'users#hours', :as=>"current_hours"
  get 'buildHours' => 'users#build_hours', :as=>"build_hours"
  
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end

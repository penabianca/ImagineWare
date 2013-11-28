HospitalLink::Application.routes.draw do
  root  to: 'static_pages#home', via: 'get'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :submissions
  post '/submit/:course', to: 'submissions#submit', as: :submit
  post '/upload', to: 'submissions#uploadFile' , as: :upload
  match '/students', to: 'users#students', via: 'get'
  get '/instructors/request/accept/:id', to: 'users#accept' , as: :accept_request
  get '/instructors/requests', to: 'users#requests', as: :request
  get 'submissions/grades/pending' ,to: 'submissions#assignments_to_grade', as: :assign_to_grade
  get '/student/grades/:id', to: 'submissions#my_grades', as: :my_grades
  get '/students/submissions/:id', to: 'submissions#student', as: :student_submissions
  match '/instructors', to: 'users#instructors', via: 'get'
  match '/signin',  to: 'sessions#new', via: 'get'
  match '/signup/students', to: 'users#new' , via: 'get'
  match '/help', to:  'static_pages#help' , via: 'get'
  match '/about', to:   'static_pages#about', via: 'get'
  match '/contact', to: 'static_pages#contact' , via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  resources :courses
  resources :attachments
  get 'tags/:tag', to: 'courses#index', as: :tag
  match '/signup/instructors', to: 'users#new_instructors', via: 'get'
  match '/create/instructors', to: 'users#create_instructors', via: 'post'
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end

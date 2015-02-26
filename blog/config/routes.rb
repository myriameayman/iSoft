Rails.application.routes.draw do
get 'users/new'
get 'users/show'

  #get 'welcome/index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'profiles#adel'
  
   
  
  #get "sign_up" => "users#new", :as => "sign_up"  
  #resources :users
  get "log_in" => "users#login", :as => "log_in"  
  get "my_account" => "users#my_account", :as => "my_account"
  get "log_out" => "users#logout", :as => "log_out"  
  get "sign_up" => "users#new", :as => "sign_up"  
  get  '/welcome/index.html.erb' , to: 'welcome#index', as: 'iSoft'
  get  '/login.html.erb' , to: 'users#login', as: 'SIGN_IN'
  get  '/adel.html.erb' , to: 'profiles#adel', as: 'PROFILES' 
  get  '/index.html.erb' , to: 'articles#index', as: 'Our_Blog'
  get  '/new.html.erb' , to: 'users#new', as: 'Sign_Up' 
  get  '/myriame.html.erb' , to: 'profiles#myriame', as: 'Myriame_Ayman'
  get  '/ebrahim.html.erb' , to: 'profiles#ebrahim', as: 'ebrahim_elgaml'
  get  '/adel.html.erb' , to: 'profiles#adel', as: 'Ahmed_Adel'
  get  '/mariam.html.erb' , to: 'profiles#mariam', as: 'Mariam_Talaat'
  get  '/maha.html.erb' , to: 'profiles#maha', as: 'Maha_Talaat' 
  get  '/ismail.html.erb' , to: 'profiles#ismail', as: 'Ahmed_Amr'
  get  '/renad.html.erb' , to: 'profiles#renad', as: 'Renad_Ebrahim'  
  resources :users do 
 post 'process_login', :on => :collection 
 end

   resources :articles do
   resources :comments 
   
    end
    resources :categories do 
    end



  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

Rails.application.routes.draw do


  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    registrations: 'authentication/registrations',
    sessions:      'authentication/sessions'
  }

  #devise_scope :user do
    #get "/cart" => "main_pages#cart"
  #end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #mount RedactorRails::Engine => '/redactor_rails'
  root 'main_pages#index'
  resources :products
  resources :main_pages
  resources :categories
  resources :subcategories
  resources :models
  resources :line_items, defaults: { format: 'json' }
  resources :orders, only: :create
  resource  :users
  
  


  get 'cart'    => 'main_pages#cart'
  get 'working' => 'main_pages#working'
  get 'contact' => 'main_pages#contact'
  get 'delivery' => 'main_pages#delivery'
  get 'persons/profile', as: 'user_root'
  post "send_comment" => "comments#send_comment"
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

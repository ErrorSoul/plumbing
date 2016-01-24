Rails.application.routes.draw do


  mount RedactorRails::Engine => '/redactor_rails'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    registrations: 'authentication/registrations',
    sessions:      'authentication/sessions'
  }

  root 'main_pages#index'
  resources :products
  resources :main_pages
  resources :categories
  resources :subcategories
  resources :models
  resources :line_items, defaults: { format: 'json' }
  resources :orders, only: :create
  resources :posts, only: [:index, :show]
  resource  :users

  namespace :converter do
    resource :dashboard, only: :show do
      member do
        get :template
      end
    end
    resources :reports, only: :create
    resources :tasks, only: :index
    resources :links, only: [:new, :show]
  end




  get 'cart'    => 'main_pages#cart'
  get 'working' => 'main_pages#working'
  get 'contact' => 'main_pages#contact'
  get 'delivery' => 'main_pages#delivery'
  get 'price'    => 'main_pages#price'
  get 'persons/profile', as: 'user_root'
  post "send_comment" => "comments#send_comment"

end

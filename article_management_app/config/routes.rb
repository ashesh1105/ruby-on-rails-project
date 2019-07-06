Rails.application.routes.draw do

  # Allows a new route (path) to dealing with articles (CRUD on them, etc)
  # with this, FE will look for a controller file named articles_controller.rb and in that a class ArticlesController < ApplicationController
  resources :articles

  get 'signup', to: 'users#new'
  resources :users, except: [:new]

  # User login and logout
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # get 'signup', to: 'users#new'
  # resources :users, except: [:new]

  # resources :people, except: [:show]
  # root to: "people#index"

  # get 'people/index'

  # get 'people/new'

  # get 'people/create'

  # get 'people/edit'

  # get 'people/update'

  # get 'people/destroy'

  resources :products

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  get 'welcome/home', to: 'welcome#home'
  get 'welcome/about', to: 'welcome#about'

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

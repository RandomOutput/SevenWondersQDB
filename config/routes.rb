SevenWondersQdb::Application.routes.draw do
  get "wonders_main/index"
  resources :quotes, :users
  resources :sessions, only: [:new, :create, :destroy]
  root to: 'wonders_main#index'
  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  delete '/signout', to: 'sessions#destroy'
  get 'quotes/:id/upvote' => 'quotes#upvote', as: :upvote
  get 'quotes/:id/downvote' => 'quotes#downvote', as: :downvote
  get 'quotes/:id/set_privacy' => 'quotes#set_privacy', as: :set_privacy
  get 'users/:id/approval' => 'users#approval', as: :approval
  #get 'quotes/:id/set_public' => 'quotes#set_public', as: :set_public
  #get 'quotes/:id/set_private' => 'quotes#set_private', as: :set_private

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

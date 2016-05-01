Rails.application.routes.draw do
  devise_for :users
  devise_for :models
  root to: "home#index"
  get 'push', to: 'push#index'
  post 'push/send_go', to: 'push#send_go'
  get 'push/save_phone', to: 'push#save_phone'
  post 'push/phone_install',to: 'push#phone_install'
  get 'down_andorid_app', to: 'app_down#down_andorid_app'
  # resources :users,:controller => "admin/users"
  post "users/create_user", to: 'users#create_user'
  get 'users/new', to: 'users#new'

  get 'users/show', to: 'users#show'
  get 'users/destroy', to: 'users#destroy'
  get 'users/update', to: "users#update"
  patch 'users/update_save', to: "users#update_save"
  # end
  get 'push/search', to: 'push#search'
  # get 'users/new',to: 'users#new'
  # post 'users/create',to: "users#create"
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

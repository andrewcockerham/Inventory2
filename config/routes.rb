Inventory2::Application.routes.draw do

  resources :my_builds

  resources :receptions

  root "purchase_orders#index"

  resources :employees

  resources :lots

  resources :parts

  resources :orders

  resources :suppliers

  resources :quantities

  resources :items

  resources :purchase_orders

  get 'items/:id/purchase_orders' => 'items#get_purchase_orders', as: :item_orders

  get 'inspection' => 'lots#inspection', as: :inspection

  ## PENDING PO's
  get 'pending_purchase_orders' => 'purchase_orders#pending', as: :pending_purchase_orders

  ### RELEASE A LOT
  get 'lots/:id/release' => 'lots#release', as: :release

  ### SONICATION LOG
  get 'sonication' => 'lots#sonication', as: :sonication

  ### PULL PATH
  get 'lots/:id/pull' => 'lots#pull', as: :pull

  ### DMR path
  get 'dmr' => 'items#dmr', as: :dmr

  # get 'receiving_log' => 'lots#receiving_log', as: :receiving_log

  # receiving log
  # get 'purchase_orders/:id/receiving' => 'purchase_orders#receiving', as: :receiving

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

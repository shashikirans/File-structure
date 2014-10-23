Sharebox::Application.routes.draw do
  resources :folders

  resources :welcomes

  resources :assets

  resources :ideas

  root :to => "welcomes#index"

  devise_for :users

  get "assets/get/:id" => "assets#get", :as => "download"

  get "browse/:folder_id" => "welcomes#browse", :as => "browse"
  get "browse/:folder_id/new_folder" => "folders#new", :as => "new_sub_folder"
  #for uploading files to folders
  get "browse/:folder_id/new_file" => "assets#new", :as => "new_sub_file"

  #for renaming a folder
  get "browse/:folder_id/rename" => "folders#edit", :as => "rename_folder"
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

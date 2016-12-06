Rails.application.routes.draw do

  default_url_options :host => "iad-taoxie1025.c9users.io" #After you pull from the repository, change this to your cloud9 address

  resource :users
  resources :posts,          only: [:create, :destroy, :update]
  resource :feedbacks
  
  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  root 'welcome#home'
  get 'welcome/about', to: 'welcome#about'
  
  get 'users/new', to: 'users#new'
  post 'users/' => 'users#show', :as => 'user'
  get 'users/set_as_admin', to: 'users#set_as_admin'
  get 'users/set_as_user', to: 'users#set_as_user'
  get 'users/delete_user', to: 'users#delete_user'
  patch 'users/update_by_admin', to: 'users#update_by_admin'

  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  get 'posts/new', to: 'posts#new'
  get 'posts/edit', to: 'posts#edit'
  get 'posts/show', to: 'posts#show'
  get 'posts/update', to: 'posts#update'
  
  get 'welcome/home', to: 'welcome#home'
  get 'welcome/show', to: 'welcome#show'
  get 'welcome/search', to: 'welcome#search'


  post 'feedback/create', to: 'feedback#create'
  get 'feedback/new', to: 'feedback#new'
  get 'search', to: 'welcome#search'
  
  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash
  
  get 'admin/show', to: 'admin#show'
  get 'admin/show_all_posts', to: 'admin#show_all_posts'


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

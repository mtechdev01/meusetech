Rails.application.routes.draw do

  root to: "pages#home"
  devise_for :users, path: "utilisateurs", path_names: {
    sign_in: 'connection',
    sign_out: 'deconnection',
    password: 'secret',
    confirmation: 'verification',
    unlock: 'deblocage',
    registration: 'enregistrement',
    sign_up: 'nouveau'
  }
  scope '/projets' do
    get '/', to: 'projects/projects#index', as: 'projectsIndex'
    get '/voir/:id', to: 'projects/projects#show', as: 'projectsShow'
    post '/comment', to: 'projects/projects#comment', as: 'projectsComment'
  end
  scope '/blog' do
    get '/', to: 'blogs/articles#index', as: 'blogIndex'
    get '/article/:id', to: 'blogs/articles#show', as: 'blogShow'
    post '/comment', to: 'blogs/articles#comment', as: 'blogComment'
  end
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

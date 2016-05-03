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

  get '/callback', to: 'pages#callback', as: 'callback'
  get '/a-propos', to: 'pages#about', as: 'about'
  post '/like/:model/:id', to: 'likes#like', as: 'likePost'
  post '/comment', to: 'comments#comment', as: 'comment'
  post '/valid/comment/:id', to: 'comments#setValid', as: 'validComment'
  post '/delete/comment/:id', to: 'comments#delete', as: 'deleteComment'
  post '/notif/read/:id', to: 'notifications#markAsRead', as: 'notifMarkAsReaded'
  post '/notif/delete/:id', to: 'notifications#delete', as: 'notifDelete'

  namespace :admin do
    get '/', to: "pages#home", as: 'adminDashboard'
    delete '/delete/:id', to: 'comments#destroy', as: 'commentsAdminDestroy'
    post '/update/:id', to: 'comments#update', as: 'commentsAdminUpdate'
      scope '/blogs' do
        get '/', to: 'blogs/articles#index', as: 'blogsAdminIndex'
        get '/voir/:slug', to: 'blogs/articles#show', as: 'blogAdminShow'
        get '/creer', to: 'blogs/articles#create', as: 'articleCreateGet'
        post '/creer', to: 'blogs/articles#create', as: 'articleCreatePost'
        get '/editer/:slug', to: 'blogs/articles#edit', as: 'articleEditGet'
        post '/editer/:slug', to: 'blogs/articles#update', as: 'articleUpdate'
        post '/supprimer-article/:slug', to: 'blogs/articles#delete', as: 'articleDelete'
        post '/comment', to: 'blogs/articles#comment', as: 'blogAdminComment'
        post '/redirecttoFacebook/:id', to: 'blogs/articles#redirecttofacebook', as: 'blogredirectToFacebook'
        get '/publishtoFacebook/:id', to: 'blogs/articles#publishtofacebook', as: 'blogPublishtoFacebook'
      end
      scope '/sondages' do
        get '/', to: 'polls/polls#index', as: 'pollsAdminIndex'
        get '/voir/:id', to: 'polls/polls#show', as: 'pollsAdminShow'
        get '/nouveau', to: 'polls/polls#create', as: 'pollsAdminCreate'
        post '/nouveau', to: 'polls/polls#create', as: 'pollsAdminCreatePost'
        get '/editer/:id', to: 'polls/polls#edit', as: 'pollsAdminEdit'
        post '/editer/:id', to: 'polls/polls#update', as: 'pollsAdminEditPost'
        get '/ajout/question/:id', to: 'polls/polls#addquestion', as: 'pollsAdminAddQuestion'
        post '/ajout/question/:id', to: 'polls/polls#addquestion', as: 'pollsAdminAddQuestionPost'
        get '/editer/question/:id', to: 'polls/polls#editquestion', as: 'pollsAdminEditQuestion'
        post '/editer/question/:id', to: 'polls/polls#updatequestion', as: 'pollsAdminEditQuestionPost'
        post '/suppression/question/:id', to: 'polls/polls#deletequestion', as: 'pollsAdminDeleteQuestion'
        post '/suppression/:id', to: 'polls/polls#delete', as: 'pollsAdminDelete'

      end
      scope '/categories' do
        get '/', to: 'category#index', as: 'categoryAdminIndex'
        get '/nouveau', to: 'category#create', as: 'categoryAdminCreate'
        post '/nouveau', to: 'category#create', as: 'categoryAdminCreatePost'
        get '/editer/:slug', to: 'category#edit', as: 'categoryAdminEdit'
        post '/editer/:slug', to: 'category#update', as: 'categoryAdminEditPost'
        post '/delete/:slug', to: 'category#delete', as: 'categoryAdminDelete'
      end
      scope '/users' do
        get '/', to: 'users/users#index', as: 'usersAdminIndex'
        get '/voir/:id', to: 'users/users#show', as: 'usersAdminShow'
        delete '/delete/:id', to: 'users/users#destroy', as: 'usersAdminDestroy'
        get '/editer/:id', to: 'users/users#edit', as: 'usersAdminEdit'
        post '/update/:id', to: 'users/users#update', as: 'usersAdminUpdate'
      end
      scope '/projets' do
        get '/', to: 'projects/projects#index', as: 'projectsAdminIndexGet'
        post '/', to: 'projects/projects#index', as: 'projectsAdminIndexPost'
        get '/creer', to: 'projects/projects#create', as: 'projectsAdminCreateGet'
        post '/creer', to: 'projects/projects#create', as: 'projectsAdminCreatePost'
        get '/editer/:slug', to: 'projects/projects#editproject', as: 'projectEditGet'
        post '/editer/:slug', to: 'projects/projects#updateproject', as: 'projectUpdate'
        post '/supprimer-projet/:slug', to: 'projects/projects#projectdelete', as: 'projectDelete'
       end
  end

  scope '/projets' do
    get '/', to: 'projects/projects#index', as: 'projectsIndex'
    get '/voir/:slug', to: 'projects/projects#show', as: 'projectShow'
    get '/creer', to: 'projects/projects#create', as: 'projectsCreateGet'
    post '/creer', to: 'projects/projects#create', as: 'projectsCreatePost'
    post '/follow/:id', to: 'projects/projects#follow', as: 'projectFollow'
    get '/categorie/:slug', to: 'projects/projects#category', as: 'projectCategory'

  end

  scope '/blog' do
    get '/', to: 'blogs/articles#index', as: 'blogIndex'
    get '/article/:slug', to: 'blogs/articles#show', as: 'blogShow'
    get '/category/:slug' , to: 'blogs/articles#category', as: 'blogCategory'
  end

  scope '/sondages' do
    get '/', to: 'polls/polls#index', as: 'pollIndex'
    get '/voir/:id', to: 'polls/polls#show', as: 'pollShow'
    post '/reponse', to: 'polls/polls#reponse', as: 'pollReponse'
    get '/stats/:id', to: 'polls/polls#stats', as: 'pollStats'
  end

  scope 'utilisateurs' do
    get '/mon-compte', to: 'users/account#account', as: 'userAccount'
    get '/mon-compte/editer', to: 'users/account#edit', as: 'userEdit'
    post '/mon-compte/update', to: 'users/account#update', as: 'userUpdate'
    get '/mon-compte/projets', to: 'users/account#projects', as: 'userProjects'
    get '/mon-compte/commentaires', to: 'users/account#comments', as: 'userComments'
    get '/mon-compte/sondages', to: 'users/account#sondages', as: 'userSondage'
    get '/mon-compte/notifications', to: 'users/account#notifications', as: 'userNotifs'
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

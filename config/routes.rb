# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#             chatroom_show GET    /chatroom/show(.:format)                                                                 chatroom#show
#                                  /cable                                                                                   #<ActionCable::Server::Base:0x00007fe1a8cff990 @mutex=#<Monitor:0x00007fe1a8cff968 @mon_owner=nil, @mon_count=0, @mon_mutex=#<Thread::Mutex:0x00007fe1a8cff918>>, @pubsub=nil, @worker_pool=nil, @event_loop=nil, @remote_connections=nil>
#                      chat GET    /chat(.:format)                                                                          chatroom#show
#           comments_create GET    /comments/create(.:format)                                                               comments#create
#              sessions_new GET    /sessions/new(.:format)                                                                  sessions#new
#           sessions_create GET    /sessions/create(.:format)                                                               sessions#create
#          sessions_destroy GET    /sessions/destroy(.:format)                                                              sessions#destroy
#                 chefs_new GET    /chefs/new(.:format)                                                                     chefs#new
#                      home GET    /home(.:format)                                                                          home#index
#                     about GET    /about(.:format)                                                                         home#about
#                    signup GET    /signup(.:format)                                                                        chefs#new
#                     login GET    /login(.:format)                                                                         sessions#new
#                           POST   /login(.:format)                                                                         sessions#create
#                    logout DELETE /logout(.:format)                                                                        sessions#destroy
#                      root GET    /                                                                                        home#index
#           recipe_comments POST   /recipes/:recipe_id/comments(.:format)                                                   comments#create
#                   recipes GET    /recipes(.:format)                                                                       recipes#index
#                           POST   /recipes(.:format)                                                                       recipes#create
#                new_recipe GET    /recipes/new(.:format)                                                                   recipes#new
#               edit_recipe GET    /recipes/:id/edit(.:format)                                                              recipes#edit
#                    recipe GET    /recipes/:id(.:format)                                                                   recipes#show
#                           PATCH  /recipes/:id(.:format)                                                                   recipes#update
#                           PUT    /recipes/:id(.:format)                                                                   recipes#update
#                           DELETE /recipes/:id(.:format)                                                                   recipes#destroy
#                     chefs GET    /chefs(.:format)                                                                         chefs#index
#                           POST   /chefs(.:format)                                                                         chefs#create
#                  new_chef GET    /chefs/new(.:format)                                                                     chefs#new
#                 edit_chef GET    /chefs/:id/edit(.:format)                                                                chefs#edit
#                      chef GET    /chefs/:id(.:format)                                                                     chefs#show
#                           PATCH  /chefs/:id(.:format)                                                                     chefs#update
#                           PUT    /chefs/:id(.:format)                                                                     chefs#update
#                           DELETE /chefs/:id(.:format)                                                                     chefs#destroy
#               ingredients GET    /ingredients(.:format)                                                                   ingredients#index
#                           POST   /ingredients(.:format)                                                                   ingredients#create
#            new_ingredient GET    /ingredients/new(.:format)                                                               ingredients#new
#                ingredient GET    /ingredients/:id(.:format)                                                               ingredients#show
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  get 'chatroom/show'
  mount ActionCable.server => '/cable'
  get 'chat', to: 'chatroom#show'
  get 'comments/create'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'chefs/new'
  get 'home', to: 'home#index'
  get 'about', to: 'home#about'
  get 'signup', to: 'chefs#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  root to: 'home#index'
  resources :recipes do
    resources :comments, only: %i[create]
  end
  resources :chefs
  resources :ingredients, only: %i[index show new create]
end

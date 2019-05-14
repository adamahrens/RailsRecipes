# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#                      home GET    /home(.:format)                                                                          home#index
#                     about GET    /about(.:format)                                                                         home#about
#                      root GET    /                                                                                        home#index
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
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  get 'chefs/new'
  get 'home', to: 'home#index'
  get 'about', to: 'home#about'
  get 'signup', to: 'chefs#new'
  root to: 'home#index'
  resources :recipes
  resources :chefs
end

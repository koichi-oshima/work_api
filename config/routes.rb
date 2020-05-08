# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#           api_v1_lectures GET    /api/v1/lectures(.:format)                                                               api/v1/lectures#index
#                           POST   /api/v1/lectures(.:format)                                                               api/v1/lectures#create
#            api_v1_lecture GET    /api/v1/lectures/:id(.:format)                                                           api/v1/lectures#show
#                           PATCH  /api/v1/lectures/:id(.:format)                                                           api/v1/lectures#update
#                           PUT    /api/v1/lectures/:id(.:format)                                                           api/v1/lectures#update
#                           DELETE /api/v1/lectures/:id(.:format)                                                           api/v1/lectures#destroy
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :lectures
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

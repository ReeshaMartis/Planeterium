Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :planets do
    :planet_infos
  end


end


## Planets CRUD
# get    '/planets',          to: 'planets#index'    # list all planets
# post   '/planets',          to: 'planets#create'   # create a new planet
# get    '/planets/:id',      to: 'planets#show'     # show a specific planet
# patch  '/planets/:id',      to: 'planets#update'   # update a planet
# put    '/planets/:id',      to: 'planets#update'   # update (alternative)
# delete '/planets/:id',      to: 'planets#destroy'  # delete a planet

# # PlanetInfos CRUD (nested under planets)
# get    '/planets/:planet_id/planet_infos',          to: 'planet_infos#index'
# post   '/planets/:planet_id/planet_infos',          to: 'planet_infos#create'
# get    '/planets/:planet_id/planet_infos/:id',      to: 'planet_infos#show'
# patch  '/planets/:planet_id/planet_infos/:id',      to: 'planet_infos#update'
# put    '/planets/:planet_id/planet_infos/:id',      to: 'planet_infos#update'
# delete '/planets/:planet_id/planet_infos/:id',      to: 'planet_infos#destroy'

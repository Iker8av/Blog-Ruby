Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  root "kanto#index"
  get "/kanto", to: "kanto#index"
  get "/kanto/:name", to: 'kanto#location'
  get 'locationName/:id', to: 'kanto#get_name_location'
  get 'location/:name', to: 'kanto#get_location'
  get 'pokemon/:name', to: 'kanto#get_pokemon_info'
  get 'adopt/:name', to: 'kanto#push_pokemon'
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end

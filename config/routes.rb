  Rails.application.routes.draw do
  root 'pages#index'
  
  # Resources
  resources :pokemon_types
  resources :types
  resources :evolutionary_chains
  resources :pokemons
  resources :regions
  
  # Index
  get '*path', to: 'pages#index', via: :all
end

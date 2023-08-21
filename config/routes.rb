Rails.application.routes.draw do
  # Resources
  resources :pokemon_types
  resources :types
  resources :evolutionary_chains
  resources :pokemons
  resources :regions  
end

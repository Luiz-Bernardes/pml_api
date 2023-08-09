Rails.application.routes.draw do
  resources :pokemon_types
  resources :types
  resources :pokemon_evolutionary_chains
  resources :evolutionary_chains
  resources :pokemons
  resources :regions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

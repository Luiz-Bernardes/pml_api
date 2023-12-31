class PokemonsController < ApplicationController
  before_action :set_pokemon, only: [:show, :update, :destroy]

  # GET /pokemons
  def index
    @pokemons = Pokemon.all

    render json: serialize_pokemon(@pokemons, options)
  end

  # GET /pokemons/1
  def show
    render json: serialize_pokemon(@pokemon, options)
  end

  # POST /pokemons
  def create
    @pokemon = Pokemon.new(pokemon_params)

    if @pokemon.save
      render json: serialize_pokemon(@pokemon, options), status: :created, location: @pokemon
    else
      render json: @pokemon.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pokemons/1
  def update
    if @pokemon.update(pokemon_params)
      render json: serialize_pokemon(@pokemon, options)
    else
      render json: @pokemon.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pokemons/1
  def destroy
    @pokemon.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pokemon
      @pokemon = Pokemon.find(params[:id])
    end

    def serialize_pokemon query, options
      PokemonSerializer.new(query, options).serialized_json
    end

    # Only allow a trusted parameter "white list" through.
    def pokemon_params
      params.require(:pokemon).permit(:region_id, :number, :name, :original_name, :classification, :height, :weight, :capture_rate, :experience_growth, :experience_growth_points, :url_image)
    end

    def options
      @options ||= { include: %i[evolutionary_chains types] } 
    end
end

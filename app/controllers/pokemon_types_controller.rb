class PokemonTypesController < ApplicationController
  before_action :set_pokemon_type, only: [:show, :update, :destroy]

  # GET /pokemon_types
  def index
    @pokemon_types = PokemonsType.all

    render json: serialize_pokemons_type(@pokemon_types, options)
  end

  # GET /pokemon_types/1
  def show
    render json: serialize_pokemons_type(@pokemon_type, options)
  end

  # POST /pokemon_types
  def create
    @pokemon_type = PokemonsType.new(pokemon_type_params)

    if @pokemon_type.save
      render json: serialize_pokemons_type(@pokemon_type, options), status: :created
    else
      render json: @pokemon_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pokemon_types/1
  def update
    if @pokemon_type.update(pokemon_type_params)
      render json: serialize_pokemons_type(@pokemon_type, options)
    else
      render json: @pokemon_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pokemon_types/1
  def destroy
    @pokemon_type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pokemon_type
      @pokemon_type = PokemonsType.find(params[:id])
    end

    def serialize_pokemons_type query, options
      PokemonsTypeSerializer.new(query, options).serialized_json
    end

    # Only allow a trusted parameter "white list" through.
    def pokemon_type_params
      params.require(:pokemons_type).permit(:type_id, :pokemon_id)
    end

    def options
      @options ||= { include: %i[] } 
    end
end
